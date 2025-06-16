package com.tim.automation.service;


import com.tim.automation.model.VmRequest;
import com.tim.automation.model.VmResult;
import com.tim.automation.observer.VMProvisionedEvent;
import com.tim.automation.stragegy.VmProvisionStrategy;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class VmProvisionService {

    private final ApplicationEventPublisher publisher;

    private final Map<String, VmProvisionStrategy> strategies; // key為@Component名稱

    public VmResult provisionVm(VmRequest req) {
        VmProvisionStrategy strategy = strategies.get(req.getProvider());
        if (strategy == null) {
            throw new IllegalArgumentException("Unsupported provider: " + req.getProvider());
        }
        VmResult result = strategy.provision(req);
        publisher.publishEvent(new VMProvisionedEvent(result.getVmId(), req.getProvider()));
        return result;
    }

    public boolean destroyVm(String provider, String vmId) {
        VmProvisionStrategy strategy = strategies.get(provider);
        if (strategy == null) {
            throw new IllegalArgumentException("Unsupported provider: " + provider);
        }
        publisher.publishEvent(new VMProvisionedEvent(vmId, provider));
        return strategy.destroy(vmId);
    }
}
