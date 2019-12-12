package com.keji;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class StatisticSystemServer {
    public static void main(String[] args) {
        new SpringApplicationBuilder(StatisticSystemServer.class).run(args);
    }
}
