# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/alperenlcr/Code/zed-aruco-master/mono

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alperenlcr/Code/zed-aruco-master/mono/build

# Include any dependencies generated for this target.
include CMakeFiles/ZED_Reloc_Aruco.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ZED_Reloc_Aruco.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ZED_Reloc_Aruco.dir/flags.make

CMakeFiles/ZED_Reloc_Aruco.dir/src/aruco.o: CMakeFiles/ZED_Reloc_Aruco.dir/flags.make
CMakeFiles/ZED_Reloc_Aruco.dir/src/aruco.o: ../src/aruco.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alperenlcr/Code/zed-aruco-master/mono/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ZED_Reloc_Aruco.dir/src/aruco.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ZED_Reloc_Aruco.dir/src/aruco.o -c /home/alperenlcr/Code/zed-aruco-master/mono/src/aruco.cpp

CMakeFiles/ZED_Reloc_Aruco.dir/src/aruco.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ZED_Reloc_Aruco.dir/src/aruco.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alperenlcr/Code/zed-aruco-master/mono/src/aruco.cpp > CMakeFiles/ZED_Reloc_Aruco.dir/src/aruco.i

CMakeFiles/ZED_Reloc_Aruco.dir/src/aruco.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ZED_Reloc_Aruco.dir/src/aruco.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alperenlcr/Code/zed-aruco-master/mono/src/aruco.cpp -o CMakeFiles/ZED_Reloc_Aruco.dir/src/aruco.s

CMakeFiles/ZED_Reloc_Aruco.dir/src/main.o: CMakeFiles/ZED_Reloc_Aruco.dir/flags.make
CMakeFiles/ZED_Reloc_Aruco.dir/src/main.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alperenlcr/Code/zed-aruco-master/mono/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/ZED_Reloc_Aruco.dir/src/main.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ZED_Reloc_Aruco.dir/src/main.o -c /home/alperenlcr/Code/zed-aruco-master/mono/src/main.cpp

CMakeFiles/ZED_Reloc_Aruco.dir/src/main.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ZED_Reloc_Aruco.dir/src/main.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alperenlcr/Code/zed-aruco-master/mono/src/main.cpp > CMakeFiles/ZED_Reloc_Aruco.dir/src/main.i

CMakeFiles/ZED_Reloc_Aruco.dir/src/main.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ZED_Reloc_Aruco.dir/src/main.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alperenlcr/Code/zed-aruco-master/mono/src/main.cpp -o CMakeFiles/ZED_Reloc_Aruco.dir/src/main.s

# Object files for target ZED_Reloc_Aruco
ZED_Reloc_Aruco_OBJECTS = \
"CMakeFiles/ZED_Reloc_Aruco.dir/src/aruco.o" \
"CMakeFiles/ZED_Reloc_Aruco.dir/src/main.o"

# External object files for target ZED_Reloc_Aruco
ZED_Reloc_Aruco_EXTERNAL_OBJECTS =

ZED_Reloc_Aruco: CMakeFiles/ZED_Reloc_Aruco.dir/src/aruco.o
ZED_Reloc_Aruco: CMakeFiles/ZED_Reloc_Aruco.dir/src/main.o
ZED_Reloc_Aruco: CMakeFiles/ZED_Reloc_Aruco.dir/build.make
ZED_Reloc_Aruco: /usr/local/zed/lib/libsl_zed.so
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopenblas.so
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libusb-1.0.so
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libnvidia-encode.so
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libcuda.so
ZED_Reloc_Aruco: /usr/local/cuda/lib64/libcudart.so
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_aruco.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_bgsegm.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_bioinspired.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_ccalib.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_dnn_objdetect.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_dnn_superres.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_dpm.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_face.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_freetype.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_fuzzy.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_hdf.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_hfs.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_img_hash.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_line_descriptor.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_quality.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_reg.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_rgbd.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_saliency.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_shape.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_stereo.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_structured_light.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_surface_matching.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_tracking.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_viz.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_xobjdetect.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_xphoto.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_datasets.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_plot.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_text.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_dnn.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_phase_unwrapping.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_optflow.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_ximgproc.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_video.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_videoio.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_imgcodecs.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.4.2.0
ZED_Reloc_Aruco: /usr/lib/x86_64-linux-gnu/libopencv_core.so.4.2.0
ZED_Reloc_Aruco: CMakeFiles/ZED_Reloc_Aruco.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alperenlcr/Code/zed-aruco-master/mono/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ZED_Reloc_Aruco"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ZED_Reloc_Aruco.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ZED_Reloc_Aruco.dir/build: ZED_Reloc_Aruco

.PHONY : CMakeFiles/ZED_Reloc_Aruco.dir/build

CMakeFiles/ZED_Reloc_Aruco.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ZED_Reloc_Aruco.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ZED_Reloc_Aruco.dir/clean

CMakeFiles/ZED_Reloc_Aruco.dir/depend:
	cd /home/alperenlcr/Code/zed-aruco-master/mono/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alperenlcr/Code/zed-aruco-master/mono /home/alperenlcr/Code/zed-aruco-master/mono /home/alperenlcr/Code/zed-aruco-master/mono/build /home/alperenlcr/Code/zed-aruco-master/mono/build /home/alperenlcr/Code/zed-aruco-master/mono/build/CMakeFiles/ZED_Reloc_Aruco.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ZED_Reloc_Aruco.dir/depend
