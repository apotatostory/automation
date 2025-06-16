package com.tim.automation.observer;

import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class NotificationObserver {

    @EventListener
    public void onVmProvisioned(VMProvisionedEvent event) {
        System.out.println("發送通知：VM 建立成功 -> " + event.vmId());
    }
}
