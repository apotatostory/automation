package com.tim.automation.observer;

import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class AuditLoggerObserver {

    @EventListener
    public void onVmProvisioned(VMProvisionedEvent event) {
        System.out.println("記錄日誌：建立 VM -> " + event.vmId());
    }
}
