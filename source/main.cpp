#include <iostream>
#include <string>
#include "MQTT_client.h"
#include "homie-cpp/client.h"
#include "test_device.h"
#include <string.h>

int main(int argc, char** argv) try {
	std::string brokerip = "127.0.0.1";
	std::string username;
	std::string password;
	std::string basetopic = "homie/";
	std::string clientid = "sample_device";

	for (int i = 1; i < argc; i++) {
		if (strcmp(argv[i], "-h") == 0) {
			if (i == argc - 1) throw std::runtime_error("Missing argument to -h");
			brokerip = argv[++i];
		}
		else if (strcmp(argv[i], "-u") == 0) {
			if (i == argc - 1) throw std::runtime_error("Missing argument to -u");
			username = argv[++i];
		}
		else if (strcmp(argv[i], "-p") == 0) {
			if (i == argc - 1) throw std::runtime_error("Missing argument to -p");
			password = argv[++i];
		}
		else if (strcmp(argv[i], "-t") == 0) {
			if (i == argc - 1) throw std::runtime_error("Missing argument to -t");
			basetopic = argv[++i];
		}
		else if (strcmp(argv[i], "-c") == 0) {
			if (i == argc - 1) throw std::runtime_error("Missing argument to -c");
			clientid = argv[++i];
		}
	}

	auto dev = std::make_shared<test_device>();
	auto node = std::make_shared<test_node>(dev);
	auto prop = std::make_shared<test_property>(node);
	node->add_property(prop);
	dev->add_node(node);

	mqtt_client c(brokerip, username, password, clientid);
	homie::client hc(c, dev, basetopic);
	prop->client = &hc;
	
	while (true) {
		c.loop();
	}
}
catch (const std::exception& e) {
	std::cerr << "Error:" << e.what() << std::endl;
}