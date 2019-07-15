set(MODULE_NAME "paho.mqtt.c")
set(REPOSITORY https://github.com/eclipse/paho.mqtt.c.git)
set(TAG v1.3.0)
set(SUB_DIR "paho.mqtt.c")
set(TARGET_DIR ${STAGING_DIR})
set(MODULE_RESOURCES_DIR ${RESOURCES_DIR}/${MODULE_NAME})

ExternalProject_Add(${MODULE_NAME}
  GIT_REPOSITORY ${REPOSITORY}
  GIT_TAG ${TAG}
  #SOURCE_SUBDIR ${SUB_DIR}
  CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX=${TARGET_DIR}
    -DSTAGING_DIR=${STAGING_DIR}
    -DPAHO_ENABLE_TESTING=FALSE
)

set(PAHO_MQTT_LIBRARY ${STAGING_DIR}/lib/libpaho-mqtt3c.so)

#ExternalProject_Get_Property(${MODULE_NAME} SOURCE_DIR)

#ExternalProject_Add_Step(${MODULE_NAME} cmakefile
#  COMMAND cp ${MODULE_RESOURCES_DIR}/CMakeLists.txt ./${SUB_DIR}/
#  DEPENDEES download
#  DEPENDERS configure build
#  WORKING_DIRECTORY ${SOURCE_DIR}
#  COMMENT "Copying cmake file..."
#)
