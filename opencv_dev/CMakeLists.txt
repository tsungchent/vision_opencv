cmake_minimum_required(VERSION 3.10)
project(opencv_dev)

find_package(ament_cmake REQUIRED)

if(UNIX AND NOT APPLE)
   set(OpenCV_PACKAGE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/opencv/linux/)
else()
   message(FATAL "OpenCV_PACKAGE_PATH  is not set")
endif()

# find_package(OpenCV 4 REQUIRED)
add_custom_target(opencv_dev ALL
  COMMAND ${CMAKE_COMMAND} -E copy_directory ${OpenCV_PACKAGE_PATH} ${CMAKE_INSTALL_PREFIX}/opencv
)
# add_custom_target(TARGET opencv_dev 
#    COMMAND ${CMAKE_COMMAND} -E copy_directory ${OpenCV_PACKAGE_PATH} ${CMAKE_INSTALL_PREFIX}/opencv
#)

set(OpenCV_DIR ${CMAKE_INSTALL_PREFIX}/opencv/lib/cmake)
# message("${CMAKE_COMMAND} -E copy_directory ${OpenCV_PACKAGE_PATH} ${CMAKE_INSTALL_PREFIX}/opencv")
# message(OpenCV_DIR ${OpenCV_DIR})
# find_library(OpenCV 4 REQUIRED)
# ament_export_dependencies(install_copy)
ament_package(CONFIG_EXTRAS "cmake/opencv_dev-extra.cmake.in")