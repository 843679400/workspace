package com.keji;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class MyEurekaServer {
    public static void main(String[] args) {
        new SpringApplicationBuilder(MyEurekaServer.class).run(args);
    }
}
