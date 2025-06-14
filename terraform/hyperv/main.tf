terraform {
  required_providers {
    hyperv = {
      source  = "taliesins/hyperv"
      version = "1.2.1"
    }
  }
}

variable "var1" { default = "" }
variable "var2" { default = "" }
variable "var3" {
  default = "default_value"
}

output "all_variables" {
  value = {
    var1 = var.var1
    var2 = var.var2
    var3 = var.var3
    # ...全部你想看的變數
  }
}

# Configure HyperV
provider "hyperv" {
  user            = "apotatostory@gmail.com"
  password        = "Timwu427"
  host            = "127.0.0.1"
  port            = 5985
  https           = false
  insecure        = true
  use_ntlm        = true
  tls_server_name = ""
  cacert_path     = ""
  cert_path       = ""
  key_path        = ""
  script_path     = "D:/Temp/terraform_%RAND%.cmd"
  timeout         = "30s"
}

# Create a switch
# resource "hyperv_network_switch" "ns" {
#   name                                    = "DMZ"
#   notes                                   = ""
#   allow_management_os                     = true
#   enable_embedded_teaming                 = false
#   enable_iov                              = false
#   enable_packet_direct                    = false
#   minimum_bandwidth_mode                  = "None"
#   switch_type                             = "Internal"
#   net_adapter_names = []
#   default_flow_minimum_bandwidth_absolute = 0
#   default_flow_minimum_bandwidth_weight   = 0
#   default_queue_vmmq_enabled              = false
#   default_queue_vmmq_queue_pairs          = 16
#   default_queue_vrss_enabled              = false
# }

# Create a vhd
# resource "hyperv_vhd" "vhd" {
#   path = "C:\\ProgramData\\Microsoft\\Windows\\Virtual Hard Disks\\Ubuntu 20.04 LTS_custom.vhdx"
#   #source               = ""
#   #source_vm            = ""
#   #source_disk          = 0
#   vhd_type = "Dynamic"
#   #parent_path          = ""
#   size = 10737418240 #10GB
#   #block_size           = 0
#   #logical_sector_size  = 0
#   #physical_sector_size = 0
# }

# Create a machine
resource "hyperv_machine_instance" "vm" {
  name                                    = "TESTDEV"
  generation                              = 2
  automatic_critical_error_action         = "Pause"
  automatic_critical_error_action_timeout = 30
  automatic_start_action                  = "StartIfRunning"
  automatic_start_delay                   = 0
  automatic_stop_action                   = "Save"
  checkpoint_type                         = "Production"
  guest_controlled_cache_types            = false
  high_memory_mapped_io_space             = 536870912
  lock_on_disconnect                      = "Off"
  low_memory_mapped_io_space              = 134217728
  memory_maximum_bytes                    = 1099511627776
  memory_minimum_bytes                    = 536870912
  memory_startup_bytes                    = 536870912
  notes                                   = ""
  processor_count                         = 1
  smart_paging_file_path                  = "C:\\ProgramData\\Microsoft\\Windows\\Hyper-V"
  snapshot_file_location = "C:\\ProgramData\\Microsoft\\Windows\\Hyper-V"
  #dynamic_memory                         = false
  static_memory                           = true
  state                                   = "Running"

  # Configure firmware
  vm_firmware {
    enable_secure_boot = "Off"
    #secure_boot_template            = ""
    preferred_network_boot_protocol = "IPv4"
    console_mode                    = "None"
    pause_after_boot_failure        = "Off"
    boot_order {
      boot_type           = "HardDiskDrive"
      controller_number   = "0"
      controller_location = "0"
    }
    boot_order {
      boot_type            = "NetworkAdapter"
      network_adapter_name = "wan"
    }
  }

  # Configure processor
  vm_processor {
    compatibility_for_migration_enabled               = false
    compatibility_for_older_operating_systems_enabled = false
    hw_thread_count_per_core                          = 0
    maximum                                           = 100
    reserve                                           = 0
    relative_weight                                   = 100
    maximum_count_per_numa_node                       = 0
    maximum_count_per_numa_socket                     = 0
    enable_host_resource_protection                   = false
    expose_virtualization_extensions                  = false

  }
  # Configure integration services
  integration_services = {
    "Guest Service Interface" = false
    "Heartbeat"               = true
    "Key-Value Pair Exchange" = true
    "Shutdown"                = true
    "Time Synchronization"    = true
    "VSS"                     = true
  }

  # Create a network adaptor
  # network_adaptors {
  #   name                                       = "wan"
  #   switch_name                                = hyperv_network_switch.ns.name
  #   management_os                              = false
  #   is_legacy                                  = false
  #   dynamic_mac_address                        = true
  #   static_mac_address                         = ""
  #   mac_address_spoofing                       = "Off"
  #   dhcp_guard                                 = "Off"
  #   router_guard                               = "Off"
  #   port_mirroring                             = "None"
  #   ieee_priority_tag                          = "Off"
  #   vmq_weight                                 = 100
  #   iov_queue_pairs_requested                  = 1
  #   iov_interrupt_moderation                   = "Off"
  #   iov_weight                                 = 100
  #   ipsec_offload_maximum_security_association = 512
  #   maximum_bandwidth                          = 0
  #   minimum_bandwidth_absolute                 = 0
  #   minimum_bandwidth_weight                   = 0
  #   mandatory_feature_id = []
  #   resource_pool_name                         = ""
  #   test_replica_pool_name                     = ""
  #   test_replica_switch_name                   = ""
  #   virtual_subnet_id                          = 0
  #   allow_teaming                              = "On"
  #   not_monitored_in_cluster                   = false
  #   storm_limit                                = 0
  #   dynamic_ip_address_limit                   = 0
  #   device_naming                              = "Off"
  #   fix_speed_10g                              = "Off"
  #   packet_direct_num_procs                    = 0
  #   packet_direct_moderation_count             = 0
  #   packet_direct_moderation_interval          = 0
  #   vrss_enabled                               = true
  #   vmmq_enabled                               = false
  #   vmmq_queue_pairs                           = 16
  # }

  # Create dvd drive
  # dvd_drives {
  #   controller_number  = "0"
  #   controller_location = "1"
  #   //path = ""
  #   path               = "c:\\web_server\\bootstrap.iso"
  #   resource_pool_name = ""
  # }

  # Create a hard disk drive
  hard_disk_drives {
    controller_type                 = "Scsi"
    controller_number               = "0"
    controller_location             = "0"
    path                            = "C:\\ProgramData\\Microsoft\\Windows\\Virtual Hard Disks\\Ubuntu 20.04 LTS_custom.vhdx"
    disk_number                     = 4294967295
    resource_pool_name              = "Primordial"
    support_persistent_reservations = false
    maximum_iops                    = 0
    minimum_iops                    = 0
    qos_policy_id                   = "00000000-0000-0000-0000-000000000000"
    override_cache_attributes       = "Default"
  }
}
