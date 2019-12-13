package com.keji.feignClientHystrix;

import com.keji.feignClient.InventoryFeifnClient;
import org.springframework.stereotype.Component;

@Component
public class InventoryHystrix implements InventoryFeifnClient {
    @Override
    public String gets() {
        return "库存失败";
    }
}
