package com.keji.feignClient;

import com.keji.feignClientHystrix.InventoryHystrix;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient(value = "INVENTORY-SYSTEM",fallback = InventoryHystrix.class)
public interface InventoryFeifnClient {

    @RequestMapping("/xxx")
    public String gets();
}
