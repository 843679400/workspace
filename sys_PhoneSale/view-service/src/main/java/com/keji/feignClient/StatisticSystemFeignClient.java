package com.keji.feignClient;

import com.keji.feignClientHystrix.StatisticSystemHystrix;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(value = "STATISTIC-SYSTEM",fallback = StatisticSystemHystrix.class)
public interface StatisticSystemFeignClient {
    @GetMapping("/xxx")
    public String getObj();
}
