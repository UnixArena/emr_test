variable "region" {
  description = "Region"
  default     = "us-east-2"
}

variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "TEST"
}

variable "environment" {
  description = "Environment for service"
  default     = "STAGE"
}

variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, etc."
  type        = map(string)
  default     = {}
}

variable "enable_emr_security_configuration" {
  description = "Enable EMR Security Configuration"
  default     = "false"
}

variable "enable_emr_cluster" {
  description = "Enable_emr_cluster"
  default     = "true"
}

variable "emr_cluster_name" {
  description = "The name of the job flow"
  default     = ""
}


variable "emr_cluster_release_label" {
  description = "emr_cluster_release_label"
}

variable "emr_cluster_service_role" {
  description = "emr_cluster_service_role"
}

variable "emr_cluster_applications" { 
  type        = list
 }
variable "emr_cluster_termination_protection" { }
variable "emr_cluster_keep_job_flow_alive_when_no_steps" { }
variable "emr_cluster_ebs_root_volume_size" { }
variable "emr_cluster_autoscaling_role" { }

variable "emr_cluster_log_uri" { }

#EC2 Attributues 
variable "key_name" { }
variable "subnet_id" { }
variable "emr_managed_master_security_group" { }
variable "emr_managed_slave_security_group" { }
#variable "service_access_security_group" { }
variable "instance_profile" { }

# Master instance specifications 
variable "instance_type_master" { }
variable "instance_count_master" { }
variable "name_emr_cluster_master_instance_group" { }
variable "ebs_config_size_master" { }
variable "ebs_config_type_master" { }
variable "ebs_config_volumes_per_instance_master" { }

# Core instance specifications 
variable "name_emr_cluster_core_instance_group" { }
variable "instance_type_core" { }
variable "instance_count_core" { }
variable "ebs_config_size_core" { }
variable "ebs_config_type_core" { }
variable "ebs_config_volumes_per_instance_core" { }

# Task instance specifications 
variable "enable_emr_instance_group" { }
variable "emr_instance_group_name" { }
variable "emr_instance_group_instance_type" { }
variable "emr_instance_group_instance_count" { }
variable "size_emr_instance_group_ebs_config" { }
variable "type_emr_instance_group_ebs_config" { }
variable "volumes_per_instance_emr_instance_group_ebs_config" { }

variable "enable_emr_managed_scaling_policy" { }
variable "minimum_capacity_units_emr_managed_scaling_policy_compute_limits" { }
variable "maximum_capacity_units_emr_managed_scaling_policy_compute_limits" { }
variable "maximum_ondemand_capacity_units_emr_managed_scaling_policy_compute_limits" { }
variable "maximum_core_capacity_units_emr_managed_scaling_policy_compute_limits" { }