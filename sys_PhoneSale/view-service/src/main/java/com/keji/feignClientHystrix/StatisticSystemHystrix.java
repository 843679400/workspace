package com.keji.feignClientHystrix;

import com.keji.feignClient.StatisticSystemFeignClient;
import org.springframework.stereotype.Component;

@Component
public class StatisticSystemHystrix implements StatisticSystemFeignClient {
    @Override
    public String getObj() {
        return "Statistic该数据微服务不可用";
    }
}
