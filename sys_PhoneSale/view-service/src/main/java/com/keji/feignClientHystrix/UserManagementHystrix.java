package com.keji.feignClientHystrix;

import com.keji.feignClient.UserManageMentFeignClient;
import org.springframework.stereotype.Component;

@Component
public class UserManagementHystrix implements UserManageMentFeignClient {
    @Override
    public String getObject() {
        return "UserManagement该数据微服务不可用";
    }

    @Override
    public String getResult(String name,String password) {
        return null;
    }

    @Override
    public String getlogin() {
        return null;
    }
}
