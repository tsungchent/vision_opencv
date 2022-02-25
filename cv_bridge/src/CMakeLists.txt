# add library
add_library(${PROJECT_NAME} cv_bridge.cpp rgb_colors.cpp)
include(GenerateExportHeader)
generate_export_header(${PROJECT_NAME} EXPORT_FILE_NAME ${PROJECT_NAME}/${PROJECT_NAME}_export.h)

target_include_directories(${PROJECT_NAME} PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>"
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>"
  "$<INSTALL_INTERFACE:include/${PROJECT_NAME}>")

ament_target_dependencies(${PROJECT_NAME}
  "sensor_msgs"
  "rcpputils"
  OpenCV
  # Boost::headers
  # opencv_core
  # opencv_imgproc
  # opencv_imgcodecs
)

# target_link_libraries(${PROJECT_NAME} PUBLIC
#  ${sensor_msgs_TARGETS}
#  opencv_core
#  opencv_imgproc
#  opencv_imgcodecs)

#target_link_libraries(${PROJECT_NAME} PRIVATE
#  Boost::headers)

# get_target_property(INCLUDE_PATH ${PROJECT_NAME} interface_include_directories)
# message(INCLUDE_PATH ${INCLUDE_PATH})

install(TARGETS ${PROJECT_NAME} EXPORT export_${PROJECT_NAME}
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin
)

install(FILES
  ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}_export.h
  DESTINATION include/${PROJECT_NAME}/${PROJECT_NAME})

if(NOT ANDROID)
  Python3_add_library(${PROJECT_NAME}_boost MODULE module.cpp module_opencv3.cpp)
  target_link_libraries(${PROJECT_NAME}_boost PRIVATE
    ${PROJECT_NAME}
    ${boost_python_target}
    Python3::NumPy)
  target_compile_definitions(${PROJECT_NAME}_boost PRIVATE PYTHON3)

  if(OpenCV_VERSION_MAJOR VERSION_EQUAL 4)
    target_compile_definitions(${PROJECT_NAME}_boost PRIVATE OPENCV_VERSION_4)
  endif()

  set_target_properties(${PROJECT_NAME}_boost PROPERTIES
                        LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/boost/
                        PREFIX ""
  )
  install(TARGETS ${PROJECT_NAME}_boost DESTINATION ${PYTHON_INSTALL_DIR}/${PROJECT_NAME}/boost/)
endif()
