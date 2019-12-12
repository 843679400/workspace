package com.keji;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class UserManagementServer {
    public static void main(String[] args) {
        new SpringApplicationBuilder(UserManagementServer.class).run(args);
    }
}
