package com.tim.automation.stragegy;

import com.tim.automation.model.VmRequest;
import com.tim.automation.model.VmResult;
import org.springframework.stereotype.Component;

@Component("azure")
public class AzureVmStrategy implements VmProvisionStrategy {

    @Override
    public VmResult provision(VmRequest request) {
        return null;
    }

    @Override
    public boolean destroy(String vmId) {
        return false;
    }
}
