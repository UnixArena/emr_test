terraform {
  required_version = "~> 1.1"
}

provider "aws" {
  region                  = var.region
}

module "terraform-aws-emr" {
  source      = "../modules/terraform-aws-emr/"
  name        = var.name
  environment = var.environment

  # EMR security
  enable_emr_security_configuration        = var.enable_emr_security_configuration
  emr_security_configuration_name          = "emr-security-config"
  #emr_security_configuration_configuration = file("./additional_files/erm-security-config.json")

  # EMR cluster
  enable_emr_cluster        = var.enable_emr_cluster
  emr_cluster_name          = var.emr_cluster_name
  emr_cluster_release_label = var.emr_cluster_release_label
  emr_cluster_service_role  = var.emr_cluster_service_role
  emr_cluster_log_uri       = var.emr_cluster_log_uri
  emr_cluster_applications                      = var.emr_cluster_applications
  #emr_cluster_additional_info                   = file("./additional_files/emr-cluster-additional_info.json")
  emr_cluster_termination_protection            = var.emr_cluster_termination_protection
  emr_cluster_keep_job_flow_alive_when_no_steps = var.emr_cluster_keep_job_flow_alive_when_no_steps
  emr_cluster_ebs_root_volume_size              = var.emr_cluster_ebs_root_volume_size
  #emr_cluster_configurations_json               = file("./additional_files/emr-cluster-configurations_json.json")
  emr_cluster_autoscaling_role                  = var.emr_cluster_autoscaling_role

  emr_cluster_ec2_attributes = [
    {
      # If you want to use private subnet:
      key_name                          = var.key_name
      subnet_id                         = var.subnet_id
      emr_managed_master_security_group = var.emr_managed_master_security_group
      emr_managed_slave_security_group  = var.emr_managed_slave_security_group
      # You cannot specify a ServiceAccessSecurityGroup for a cluster launched in public subnet
      # service_access_security_group = var.service_access_security_group
      instance_profile              = var.instance_profile
    }
  ]

  emr_cluster_master_instance_group = [
    {
      name = var.name_emr_cluster_master_instance_group
      instance_type  = var.instance_type_master
      instance_count = var.instance_count_master

      ebs_config = {
        size                 = var.ebs_config_size_master
        type                 = var.ebs_config_type_master
        volumes_per_instance = var.ebs_config_volumes_per_instance_master
      }
    }
  ]

  emr_cluster_core_instance_group = [
    {
      name = var.name_emr_cluster_core_instance_group
      instance_type  = var.instance_type_core
      instance_count = var.instance_count_core
      #autoscaling_policy = file("./additional_files/emr-cluster-core_instance_group-autoscaling_policy.json")

      ebs_config = {
        size                 = var.ebs_config_size_core
        type                 = var.ebs_config_type_core
        volumes_per_instance = var.ebs_config_volumes_per_instance_core
      }
    }
  ]

  # The VPC/subnet configuration was invalid: Your cluster needs access to SQS to enable debugging but subnet does not have route to access SQS. Learn more about private subnet configurations: https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-plan-vpc-subnet.html
  #emr_cluster_bootstrap_action = [
  #  {
  #    path = "s3://elasticmapreduce/bootstrap-actions/run-if"
  #    name = "runif"
  #    args = ["instance.isMaster=true", "echo running on master node"]
  #  }
  #    ]

 
  emr_cluster_step = [
    {
      name              = "Setup Hadoop Debugging"
      action_on_failure = "CANCEL_AND_WAIT"

      hadoop_jar_step = {
        jar  = "command-runner.jar"
        args = ["state-pusher-script"]
      }
    }
  ]

  # EMR instance group
  enable_emr_instance_group         = var.enable_emr_instance_group
  emr_instance_group_name           = var.emr_instance_group_name
  emr_instance_group_instance_type  = var.emr_instance_group_instance_type
  emr_instance_group_instance_count = var.emr_instance_group_instance_count
  emr_instance_group_ebs_config = [{
    size                 = var.size_emr_instance_group_ebs_config
    type                 = var.type_emr_instance_group_ebs_config
    volumes_per_instance = var.volumes_per_instance_emr_instance_group_ebs_config
  }]

 # emr_instance_group_autoscaling_policy  = file("./additional_files/emr-cluster-core_instance_group-autoscaling_policy.json")
 # emr_instance_group_configurations_json = file("./additional_files/emr-cluster-configurations_json.json")

  # EMR managed scaling policy
  enable_emr_managed_scaling_policy = var.enable_emr_managed_scaling_policy
  emr_managed_scaling_policy_compute_limits = [
    {
      unit_type                       = "Instances"
      minimum_capacity_units          = var.minimum_capacity_units_emr_managed_scaling_policy_compute_limits
      maximum_capacity_units          = var.maximum_capacity_units_emr_managed_scaling_policy_compute_limits
      maximum_ondemand_capacity_units = var.maximum_ondemand_capacity_units_emr_managed_scaling_policy_compute_limits
      maximum_core_capacity_units     = var.maximum_core_capacity_units_emr_managed_scaling_policy_compute_limits
    }
  ]
  }