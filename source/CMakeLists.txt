
add_executable(homie_example main.cpp MQTT_client.cpp)
target_include_directories(homie_example PUBLIC ${STAGING_DIR}/include/ )
target_link_libraries(homie_example ${PAHO_MQTT_LIBRARY})

add_dependencies(homie_example paho.mqtt.c homie-cpp)