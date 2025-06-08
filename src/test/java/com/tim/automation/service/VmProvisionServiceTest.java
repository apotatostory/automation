package com.tim.automation.service;

import com.tim.automation.model.VmRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class VmProvisionServiceTest {

    @Autowired
    private VmProvisionService vmProvisionService;

    @Test
    public void test() {
        VmRequest request = new VmRequest();
        request.setProvider("azure");
        vmProvisionService.provisionVm(request);
    }

}
