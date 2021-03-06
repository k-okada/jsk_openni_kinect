# http://ros.org/doc/groovy/api/catkin/html/user_guide/supposed.html
cmake_minimum_required(VERSION 2.8.3)
project(openni_swipe)
# Load catkin and all dependencies required for this package
# TODO: remove all from COMPONENTS that are not catkin packages.
#find_package(catkin REQUIRED COMPONENTS roscpp roslib geometry_msgs openni nite tf)
find_package(catkin REQUIRED COMPONENTS roscpp roslib std_msgs)

find_package(PkgConfig)
pkg_check_modules(PC_LIBOPENNI REQUIRED libopenni)
#pkg_check_modules(PC_NITE_DEV REQUIRED nite-dev)
set(PC_NITE_DEV_INCLUDE_DIRS "/usr/include/nite")
set(PC_NITE_DEV_LIBRARIES XnVNite_1_3_1;OpenNI)


# TODO: fill in what other packages will need to use this package
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need

catkin_package(
    DEPENDS openni nite
    CATKIN-DEPENDS roscpp roslib std_msgs
    #INCLUDE_DIRS include
    LIBRARIES ${PROJECT_NAME}
)

include_directories(
  ${PC_LIBOPENNI_INCLUDE_DIRS}
  ${PC_NITE_DEV_INCLUDE_DIRS}
  ${catkin_INCLUDE_DIRS})
add_definitions(${PC_LIBOPENNI_CFLAGS_OTHER})
add_executable(openni_swipe src/openni_swipe.cpp)
target_link_libraries(openni_swipe ${catkin_LIBRARIES} ${PC_NITE_DEV_LIBRARIES})

install(TARGETS ${PROJECT_NAME} openni_swipe
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(FILES openni_swipe.xml
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
