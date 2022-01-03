region = "us-east-2"
name = "TEST"
environment = "STAGE"

enable_emr_security_configuration = "false"

enable_emr_cluster = "true"
emr_cluster_name = "Test_EMR"
emr_cluster_release_label = "emr-5.33.1"
emr_cluster_service_role = "arn:aws:iam::476227053747:role/emr-service-role"

#emr_cluster_applications  = ["Hadoop", "JupyterEnterpriseGateway", "Hive", "JupyterHub", "Ganglia", "Spark", "HCatalog", "Sqoop", "Zeppelin", "Livy" ]
emr_cluster_applications  = ["Hadoop", "JupyterEnterpriseGateway", "Hive", "JupyterHub", "Ganglia", "Spark", "HCatalog", "Sqoop"]
emr_cluster_termination_protection  = "true"
emr_cluster_keep_job_flow_alive_when_no_steps  = "true"
emr_cluster_ebs_root_volume_size  = "30"
emr_cluster_autoscaling_role  = "arn:aws:iam::476227053747:role/emr-service-role"

emr_cluster_log_uri = "s3://test1ualin/emr/"
#EC2 Attributues 
key_name   = "AWS_Windows"
subnet_id  = "subnet-09ccdc73"
emr_managed_master_security_group  = "sg-0557fc93c83ed440b"
emr_managed_slave_security_group  = "sg-0557fc93c83ed440b"
#service_access_security_group  = "sg-0557fc93c83ed440b"
instance_profile  = "arn:aws:iam::476227053747:instance-profile/Instance_profile_ec2_call_emr"

# Master instance specifications 
instance_type_master  = "m4.large"
instance_count_master  = "1"
name_emr_cluster_master_instance_group  = "Master-1"
ebs_config_size_master  = "20"
ebs_config_type_master  = "gp2"
ebs_config_volumes_per_instance_master  = "1"

# Core instance specifications 
name_emr_cluster_core_instance_group  = "CORE-1"
instance_type_core  = "m4.large"
instance_count_core  = "1"
ebs_config_size_core  = "20"
ebs_config_type_core  = "gp2"
ebs_config_volumes_per_instance_core  = "1"

# Task instance specifications 
enable_emr_instance_group  = "true"
emr_instance_group_name  = "TASK-1"
emr_instance_group_instance_type  = "m4.large"
emr_instance_group_instance_count  = "1"
size_emr_instance_group_ebs_config  = "20"
type_emr_instance_group_ebs_config  = "gp2"
volumes_per_instance_emr_instance_group_ebs_config  = "1"

enable_emr_managed_scaling_policy  = "true"
minimum_capacity_units_emr_managed_scaling_policy_compute_limits  = "2"
maximum_capacity_units_emr_managed_scaling_policy_compute_limits  = "10"
maximum_ondemand_capacity_units_emr_managed_scaling_policy_compute_limits  = "2"
maximum_core_capacity_units_emr_managed_scaling_policy_compute_limits  = "2"