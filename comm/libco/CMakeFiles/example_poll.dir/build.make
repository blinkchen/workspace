# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/blinkchen/workspace/comm/libco

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/blinkchen/workspace/comm/libco

# Include any dependencies generated for this target.
include CMakeFiles/example_poll.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/example_poll.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/example_poll.dir/flags.make

CMakeFiles/example_poll.dir/example_poll.cpp.o: CMakeFiles/example_poll.dir/flags.make
CMakeFiles/example_poll.dir/example_poll.cpp.o: example_poll.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/blinkchen/workspace/comm/libco/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/example_poll.dir/example_poll.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/example_poll.dir/example_poll.cpp.o -c /home/blinkchen/workspace/comm/libco/example_poll.cpp

CMakeFiles/example_poll.dir/example_poll.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example_poll.dir/example_poll.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/blinkchen/workspace/comm/libco/example_poll.cpp > CMakeFiles/example_poll.dir/example_poll.cpp.i

CMakeFiles/example_poll.dir/example_poll.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example_poll.dir/example_poll.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/blinkchen/workspace/comm/libco/example_poll.cpp -o CMakeFiles/example_poll.dir/example_poll.cpp.s

CMakeFiles/example_poll.dir/example_poll.cpp.o.requires:
.PHONY : CMakeFiles/example_poll.dir/example_poll.cpp.o.requires

CMakeFiles/example_poll.dir/example_poll.cpp.o.provides: CMakeFiles/example_poll.dir/example_poll.cpp.o.requires
	$(MAKE) -f CMakeFiles/example_poll.dir/build.make CMakeFiles/example_poll.dir/example_poll.cpp.o.provides.build
.PHONY : CMakeFiles/example_poll.dir/example_poll.cpp.o.provides

CMakeFiles/example_poll.dir/example_poll.cpp.o.provides.build: CMakeFiles/example_poll.dir/example_poll.cpp.o

# Object files for target example_poll
example_poll_OBJECTS = \
"CMakeFiles/example_poll.dir/example_poll.cpp.o"

# External object files for target example_poll
example_poll_EXTERNAL_OBJECTS =

example_poll: CMakeFiles/example_poll.dir/example_poll.cpp.o
example_poll: CMakeFiles/example_poll.dir/build.make
example_poll: libcolib.a
example_poll: CMakeFiles/example_poll.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable example_poll"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_poll.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/example_poll.dir/build: example_poll
.PHONY : CMakeFiles/example_poll.dir/build

CMakeFiles/example_poll.dir/requires: CMakeFiles/example_poll.dir/example_poll.cpp.o.requires
.PHONY : CMakeFiles/example_poll.dir/requires

CMakeFiles/example_poll.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/example_poll.dir/cmake_clean.cmake
.PHONY : CMakeFiles/example_poll.dir/clean

CMakeFiles/example_poll.dir/depend:
	cd /home/blinkchen/workspace/comm/libco && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/blinkchen/workspace/comm/libco /home/blinkchen/workspace/comm/libco /home/blinkchen/workspace/comm/libco /home/blinkchen/workspace/comm/libco /home/blinkchen/workspace/comm/libco/CMakeFiles/example_poll.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/example_poll.dir/depend

