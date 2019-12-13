package com.keji.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * LoginController
 *
 * @author litianxiao
 * @date 2019/12/13
 */
@RestController
public class LoginController {

    /**
     * 登录
     * @return
     */
    @RequestMapping("/localhost/callback")
    public String getlogin(){
        return "null";
    }
}
