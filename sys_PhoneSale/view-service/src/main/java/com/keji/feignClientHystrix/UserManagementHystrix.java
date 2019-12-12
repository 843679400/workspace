package com.keji.feignClientHystrix;

import com.keji.feignClient.UserManageMentFeignClient;
import org.springframework.stereotype.Component;

@Component
public class UserManagementHystrix implements UserManageMentFeignClient {
    @Override
    public String getObject() {
        return "UserManagement该数据微服务不可用";
    }
}
