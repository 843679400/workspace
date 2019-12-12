package com.keji;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class SellSystemServer {
    public static void main(String[] args) {
        new SpringApplicationBuilder(SellSystemServer.class).run(args);
    }
}
