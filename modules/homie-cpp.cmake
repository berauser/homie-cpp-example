set(MODULE_NAME "homie-cpp")
set(REPOSITORY https://github.com/Thalhammer/homie-cpp.git)
set(TAG 05206e4a7d494416d5ed8ea489a50c4708b5db34)
set(SUB_DIR "homie-cpp")
set(TARGET_DIR ${STAGING_DIR})
set(MODULE_RESOURCES_DIR ${RESOURCES_DIR}/${MODULE_NAME})

ExternalProject_Add(${MODULE_NAME}
  GIT_REPOSITORY ${REPOSITORY}
  GIT_TAG ${TAG}
  SOURCE_SUBDIR ${SUB_DIR}
  CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX=${TARGET_DIR}
    -DSTAGING_DIR=${STAGING_DIR}
)

ExternalProject_Get_Property(${MODULE_NAME} SOURCE_DIR)

ExternalProject_Add_Step(${MODULE_NAME} cmakefile
  COMMAND cp ${MODULE_RESOURCES_DIR}/CMakeLists.txt ./${SUB_DIR}/
  DEPENDEES download
  DEPENDERS configure build
  WORKING_DIRECTORY ${SOURCE_DIR}
  COMMENT "Copying cmake file..."
)
