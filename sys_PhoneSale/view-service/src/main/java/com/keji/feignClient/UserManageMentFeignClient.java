package com.keji.feignClient;

import com.keji.feignClientHystrix.UserManagementHystrix;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(value = "USER-MANAGEMENT",fallback = UserManagementHystrix.class)
public interface UserManageMentFeignClient {

    @GetMapping("/xxx")
    public String getObject();
}
