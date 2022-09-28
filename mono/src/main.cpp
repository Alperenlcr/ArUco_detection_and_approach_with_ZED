///////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2020, STEREOLABS.
//
// All rights reserved.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
///////////////////////////////////////////////////////////////////////////

/***********************************************************************************************
 ** This sample demonstrates how to reloc a ZED camera using an ArUco marker.                  **
 ** Images are captured with the ZED SDK and cameras poses is then computed from ArUco pattern **
 ** to reset ZED tracking with this known position.                                            **
 ***********************************************************************************************/

// ZED includes
#include <sl/Camera.hpp>

// Sample includes
#include "aruco.hpp"

// OCV includes
#include <opencv2/opencv.hpp>

#include <fstream>
	
using namespace sl;
using namespace std;

// #define PATH_TO_TXT "/home/alperenlcr/Code/zed-aruco-master/mono/src/data.txt"
#define COMMAND_PATH "/usr/bin/python3 /home/alperenlcr/Code/zed-aruco-master/Driver.py "


struct information
{
    int ID;
    pair<int, int> center;
    float distance;
};


void ros_interface(vector<int> ids, vector<vector<cv::Point2f>> corners, sl::Mat depth)
{
// ID, center, distance
    vector<information> data;
    float depth_value;
    int x, y, i;
    // string command;
    pair<int, int> center;
    for ( i = 0; i < ids.size(); i++)
    {
        x = (int) ((corners[i][0].x + corners[i][1].x + corners[i][2].x + corners[i][3].x) / 4);
        y = (int) ((corners[i][0].y + corners[i][1].y + corners[i][2].y + corners[i][3].y) / 4);
        center = make_pair(x, y);
        depth.getValue(x, y, &depth_value);
        if (depth_value < 100 && depth_value > 0)
            data.push_back({ids[i], center, depth_value});
    }
    
    // ofstream fw(PATH_TO_TXT);
    string command = COMMAND_PATH;
    for ( i = 0; i < data.size(); i++)
    {
        // printf("ID : %d \t center : (%d, %d) \t distance : %f mm\n", data[i].ID, data[i].center.first, data[i].center.second, data[i].distance);
        // fw << data[i].ID << " " << data[i].center.first << " " << data[i].center.second << " " << data[i].distance << "\n";
        command.append(to_string(data[i].ID));
        command.append(" ");
        command.append(to_string(data[i].center.first));
        command.append(" ");
        command.append(to_string(data[i].center.second));
        command.append(" ");
        command.append(to_string(data[i].distance));
        command.append(" ");
    }
    const char * c = command.c_str();
    system(c);
    data.clear();
}



int main(int argc, char **argv) {

    // Create a ZED camera object
    Camera zed;

    // Set configuration parameters
    InitParameters init_params;
    init_params.camera_resolution = RESOLUTION::HD720;
    init_params.coordinate_units = UNIT::METER;
    init_params.sensors_required = false;

    // Open the camera
    ERROR_CODE err = zed.open(init_params);
    if (err != ERROR_CODE::SUCCESS) {
        cout << "Error, unable to open ZED camera: " << err << "\n";
        zed.close();
        return 1; // Quit if an error occurred
    }

    auto cameraInfo = zed.getCameraInformation();
    Resolution image_size = cameraInfo.camera_resolution;
    Mat image_zed(image_size, MAT_TYPE::U8_C4);
    cv::Mat image_ocv = cv::Mat(image_zed.getHeight(), image_zed.getWidth(), CV_8UC4, image_zed.getPtr<sl::uchar1>(MEM::CPU));
    cv::Mat image_ocv_rgb;

    auto calibInfo = cameraInfo.calibration_parameters.left_cam;
    cv::Matx33d camera_matrix = cv::Matx33d::eye();
    camera_matrix(0, 0) = calibInfo.fx;
    camera_matrix(1, 1) = calibInfo.fy;
    camera_matrix(0, 2) = calibInfo.cx;
    camera_matrix(1, 2) = calibInfo.cy;

    cv::Matx<float, 4, 1> dist_coeffs = cv::Vec4f::zeros();

    float actual_marker_size_meters = 0.16f; // real marker size in meters
    auto dictionary = cv::aruco::getPredefinedDictionary(cv::aruco::DICT_4X4_50);

    cout << "Make sure the ArUco marker is a 4x4 (50), measuring " << actual_marker_size_meters * 1000 << " mm" << endl;

    Transform pose;
    Pose zed_pose;
    vector<cv::Vec3d> rvecs, tvecs;
    vector<int> ids;
    vector<vector<cv::Point2f> > corners;
    string position_txt;

    bool can_reset = false;

    PositionalTrackingParameters tracking_params;
    tracking_params.enable_imu_fusion = false; // for this sample, IMU (of ZED-M) is disable, we use the gravity given by the marker.
    zed.enablePositionalTracking(tracking_params);

//@    cv::VideoWriter video("captured.avi", cv::VideoWriter::fourcc('M', 'J', 'P', 'G'), cv::CAP_PROP_FPS, cv::Size(image_zed.getWidth(), image_zed.getHeight()), true);
// Loop until 'q' is pressed
    char key = '.';
    while (key != 'q') {
        if (zed.grab() == ERROR_CODE::SUCCESS) {
            // Retrieve the left image
            zed.retrieveImage(image_zed, VIEW::LEFT, MEM::CPU, image_size);

            // convert to RGB
            cv::cvtColor(image_ocv, image_ocv_rgb, cv::COLOR_RGBA2RGB);
            // detect marker
            cv::aruco::detectMarkers(image_ocv_rgb, dictionary, corners, ids);

            // get actual ZED position
            zed.getPosition(zed_pose);
            // display ZED position
            cv::rectangle(image_ocv_rgb, cv::Point(0, 0), cv::Point(490, 75), cv::Scalar(0, 0, 0), -1);
            cv::putText(image_ocv_rgb, "Loaded dictionary : 4x4.     Press 'SPACE' to reset the camera position", cv::Point(10, 15), cv::FONT_HERSHEY_SIMPLEX, 0.4, cv::Scalar(220, 220, 220));
            position_txt = "ZED  x: " + to_string(zed_pose.pose_data.tx) + "; y: " + to_string(zed_pose.pose_data.ty) + "; z: " + to_string(zed_pose.pose_data.tz);
            cv::putText(image_ocv_rgb, position_txt, cv::Point(10, 35), cv::FONT_HERSHEY_SIMPLEX, 0.6, cv::Scalar(236, 188, 26));
            
            // vector<float> zed_coor;
            // zed_coor.push_back((float) zed_pose.pose_data.tx);
            // zed_coor.push_back((float) zed_pose.pose_data.ty);
            // zed_coor.push_back((float) zed_pose.pose_data.tz);
            
            // if at least one marker detected
            if (ids.size() > 0) {
                int counter = 0;
                // vector<vector<float>> coordinates;
                // vector<vector<float>> rotations;
                while (ids.size() != counter)
                {
                    // coordinates.push_back(vector<float> ());
                    // rotations.push_back(vector<float> ());
                    cv::aruco::estimatePoseSingleMarkers(corners, actual_marker_size_meters, camera_matrix, dist_coeffs, rvecs, tvecs);
                    pose.setTranslation(sl::float3(tvecs[counter](0), tvecs[counter](1), tvecs[counter](2)));
                    pose.setRotationVector(sl::float3(rvecs[counter](0), rvecs[counter](1), rvecs[counter](2)));
                    pose.inverse();
                    // for (int c = 0; c < 3; c++)
                    //     rotations[counter].push_back((float) rvecs[counter](c));

                    // coordinates[counter].push_back((float) pose.tx);
                    // coordinates[counter].push_back((float) pose.ty);
                    // coordinates[counter].push_back((float) pose.tz);
                    
                    cv::aruco::drawDetectedMarkers(image_ocv_rgb, corners, ids);
                    cv::aruco::drawAxis(image_ocv_rgb, camera_matrix, dist_coeffs, rvecs[0], tvecs[0], actual_marker_size_meters * 0.5f);
                    position_txt = "ArUco x: " + to_string(pose.tx) + "; y: " + to_string(pose.ty) + "; z: " + to_string(pose.tz);
                    cv::putText(image_ocv_rgb, position_txt, cv::Point(10, 60 + counter*25), cv::FONT_HERSHEY_SIMPLEX, 0.6, cv::Scalar(124, 252, 124));
                    counter ++;
//@                    video.write(image_ocv_rgb);
                }
                can_reset = true;
                    // Capture 50 images and depth, then stop
                    int i = 0;
                    sl::Mat image, depth;
                    while (i < 50) {
                        // Grab an image
                        if (1) {	// zed.grab(runtime_parameters) == ERROR_CODE::SUCCESS
                            // A new image is available if grab() returns ERROR_CODE::SUCCESS
                            zed.retrieveImage(image, VIEW::LEFT); // Get the left image
                            zed.retrieveMeasure(depth, MEASURE::DEPTH); // Retrieve depth matrix. Depth is aligned on the left RGB image.
                            //zed.retrieveMeasure(point_cloud, MEASURE::XYZRGBA); // Retrieve colored point cloud
                            i++;
                        }
                    }
                ros_interface(ids, corners, depth);
            } else
                can_reset = false;

	                
            // Display image
            cv::imshow("Image", image_ocv_rgb);
//@            video.write(image_ocv_rgb);

            // Handle key event
            key = cv::waitKey(10);

            // if KEY_R is pressed and aruco marker is visible, then reset ZED position
            if ((key == ' ') && can_reset)
                zed.resetPositionalTracking(pose);

        }
    }
    zed.close();
//    video.release();
    return 0;

}


/*
WORST CASEDE 4 METREDEN YAKIN GÖRMÜYOR
2 METRE DEN SONRA PLANLANMIŞ YAKLAŞMA YAPILMALI
*/
