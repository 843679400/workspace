package com.keji.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    @RequestMapping("/xxx")
    public String getc(){
        return "user";
    }

    @RequestMapping("/login")
    public String getResult(String name,String password){
        if(name.equals("123") && password.equals("123")){
            return "ok";
        }else {
            return "no";
        }
    }
}
