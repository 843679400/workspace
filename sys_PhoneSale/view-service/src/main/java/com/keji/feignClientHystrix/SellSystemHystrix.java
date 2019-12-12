package com.keji.feignClientHystrix;

import com.keji.feignClient.SellSystemFeignClient;
import org.springframework.stereotype.Component;

@Component
public class SellSystemHystrix implements SellSystemFeignClient {
    @Override
    public String getObj() {
        return "sell该数据微服务不可用";
    }
}
