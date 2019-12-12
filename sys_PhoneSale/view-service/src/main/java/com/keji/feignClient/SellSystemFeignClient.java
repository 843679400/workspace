package com.keji.feignClient;

import com.keji.feignClientHystrix.SellSystemHystrix;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(value = "SELLSYSTEM",fallback = SellSystemHystrix.class)
public interface SellSystemFeignClient {
    @GetMapping("/xxx")
    public String getObj();
}
