package com.tim.automation.model;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VmRequest {

    private String provider; // "azure" / "hyperv" / "vmware"
    private String os;
    private String spec;
}
