package com.keji.controller;

import com.keji.feignClient.SellSystemFeignClient;
import com.keji.feignClient.StatisticSystemFeignClient;
import com.keji.feignClient.UserManageMentFeignClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @Autowired
    private SellSystemFeignClient sellSystemFeignClient;

    @Autowired
    private StatisticSystemFeignClient statisticSystemFeignClient;

    @Autowired
    private UserManageMentFeignClient userManageMentFeignClient;

    @RequestMapping("/sell")
    public String getResutl(){
        return sellSystemFeignClient.getObj();
    }

    @RequestMapping("/statistic")
    public String getR(){
        return statisticSystemFeignClient.getObj();
    }

    @RequestMapping("/user")
    public String getu(){
        return userManageMentFeignClient.getObject();
    }
}
