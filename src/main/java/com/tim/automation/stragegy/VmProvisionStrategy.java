package com.tim.automation.stragegy;

import com.tim.automation.model.VmRequest;
import com.tim.automation.model.VmResult;

public interface VmProvisionStrategy {

    VmResult provision(VmRequest request);

    boolean destroy(String vmId);
}
