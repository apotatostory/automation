package com.tim.automation.controller;

import com.tim.automation.model.VmRequest;
import com.tim.automation.model.VmResult;
import com.tim.automation.service.VmProvisionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/vm")
public class VmController {

    @Autowired
    private VmProvisionService service;

    @PostMapping("/provision")
    public VmResult provision(@RequestBody VmRequest req) {
        return service.provisionVm(req);
    }

    @PostMapping("/destroy")
    public boolean destroy(@RequestParam String provider, @RequestParam String vmId) {
        return service.destroyVm(provider, vmId);
    }
}
