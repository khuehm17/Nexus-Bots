# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/build

# Include any dependencies generated for this target.
include opencv_tests/CMakeFiles/cv_test_node.dir/depend.make

# Include the progress variables for this target.
include opencv_tests/CMakeFiles/cv_test_node.dir/progress.make

# Include the compile flags for this target's objects.
include opencv_tests/CMakeFiles/cv_test_node.dir/flags.make

opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o: opencv_tests/CMakeFiles/cv_test_node.dir/flags.make
opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o: /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/src/opencv_tests/src/cv_test_node.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o"
	cd /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/build/opencv_tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o -c /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/src/opencv_tests/src/cv_test_node.cpp

opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.i"
	cd /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/build/opencv_tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/src/opencv_tests/src/cv_test_node.cpp > CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.i

opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.s"
	cd /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/build/opencv_tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/src/opencv_tests/src/cv_test_node.cpp -o CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.s

opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o.requires:

.PHONY : opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o.requires

opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o.provides: opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o.requires
	$(MAKE) -f opencv_tests/CMakeFiles/cv_test_node.dir/build.make opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o.provides.build
.PHONY : opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o.provides

opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o.provides.build: opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o


# Object files for target cv_test_node
cv_test_node_OBJECTS = \
"CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o"

# External object files for target cv_test_node
cv_test_node_EXTERNAL_OBJECTS =

/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: opencv_tests/CMakeFiles/cv_test_node.dir/build.make
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_dnn.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_gapi.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_highgui.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_ml.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_objdetect.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_photo.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_stitching.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_video.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_videoio.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /opt/ros/melodic/lib/libcv_bridge.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_core.so.3.2.0
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_imgproc.so.3.2.0
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_imgcodecs.so.3.2.0
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /opt/ros/melodic/lib/libimage_transport.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /opt/ros/melodic/lib/libmessage_filters.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /opt/ros/melodic/lib/libclass_loader.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/libPocoFoundation.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libdl.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /opt/ros/melodic/lib/libroslib.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /opt/ros/melodic/lib/librospack.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libpython2.7.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libboost_program_options.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libtinyxml2.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /opt/ros/melodic/lib/libroscpp.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libboost_filesystem.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /opt/ros/melodic/lib/librosconsole.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/liblog4cxx.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libboost_regex.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /opt/ros/melodic/lib/librostime.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /opt/ros/melodic/lib/libcpp_common.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libboost_system.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libboost_thread.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libboost_chrono.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libboost_date_time.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libboost_atomic.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libpthread.so
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libconsole_bridge.so.0.4
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_imgcodecs.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_calib3d.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_features2d.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_flann.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_imgproc.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: /usr/lib/aarch64-linux-gnu/libopencv_core.so.4.1.1
/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node: opencv_tests/CMakeFiles/cv_test_node.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node"
	cd /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/build/opencv_tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cv_test_node.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
opencv_tests/CMakeFiles/cv_test_node.dir/build: /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/devel/lib/opencv_tests/cv_test_node

.PHONY : opencv_tests/CMakeFiles/cv_test_node.dir/build

opencv_tests/CMakeFiles/cv_test_node.dir/requires: opencv_tests/CMakeFiles/cv_test_node.dir/src/cv_test_node.cpp.o.requires

.PHONY : opencv_tests/CMakeFiles/cv_test_node.dir/requires

opencv_tests/CMakeFiles/cv_test_node.dir/clean:
	cd /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/build/opencv_tests && $(CMAKE_COMMAND) -P CMakeFiles/cv_test_node.dir/cmake_clean.cmake
.PHONY : opencv_tests/CMakeFiles/cv_test_node.dir/clean

opencv_tests/CMakeFiles/cv_test_node.dir/depend:
	cd /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/src /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/src/opencv_tests /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/build /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/build/opencv_tests /home/blackwind/workspace/Nexus-Bots/nexus-ros/jetnano/build/opencv_tests/CMakeFiles/cv_test_node.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : opencv_tests/CMakeFiles/cv_test_node.dir/depend

