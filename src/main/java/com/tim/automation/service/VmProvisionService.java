package com.tim.automation.service;


import com.tim.automation.model.VmRequest;
import com.tim.automation.model.VmResult;
import com.tim.automation.stragegy.VmProvisionStrategy;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VmProvisionService {

    @Autowired
    private Map<String, VmProvisionStrategy> strategies; // key為@Component名稱

    public VmResult provisionVm(VmRequest req) {
        VmProvisionStrategy strategy = strategies.get(req.getProvider());
        if (strategy == null) {
            throw new IllegalArgumentException("Unsupported provider: " + req.getProvider());
        }
        return strategy.provision(req);
    }

    public boolean destroyVm(String provider, String vmId) {
        VmProvisionStrategy strategy = strategies.get(provider);
        if (strategy == null) {
            throw new IllegalArgumentException("Unsupported provider: " + provider);
        }
        return strategy.destroy(vmId);
    }
}
