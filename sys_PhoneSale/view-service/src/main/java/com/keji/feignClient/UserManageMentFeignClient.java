package com.keji.feignClient;

import com.keji.feignClientHystrix.UserManagementHystrix;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "USER-MANAGEMENT",fallback = UserManagementHystrix.class)
public interface UserManageMentFeignClient {

    @GetMapping("/xxx")
    public String getObject();

    @RequestMapping("/login")
     public String getResult(@RequestParam("name")String name,@RequestParam("password") String password);

    @RequestMapping("/callback")
    public String getlogin();
}
