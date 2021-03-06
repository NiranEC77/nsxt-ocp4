// ID identifying the cluster to create. Use your username so that resources created can be tracked back to you.
cluster_id = "oc4"

// Domain of the cluster. This should be "${cluster_id}.${base_domain}".
cluster_domain = "oc4.corp.local"

// Base domain from which the cluster domain is a subdomain.
base_domain = "corp.local"

// Name of the vSphere server. The dev cluster is on "vcsa.vmware.devcluster.openshift.com".
vsphere_server = "vcsa-01a.corp.local"

// User on the vSphere server.
vsphere_user = "administrator@corp.local"

// Password of the user on the vSphere server.
vsphere_password = "VMware1!"

// Name of the vSphere cluster. The dev cluster is "devel".
vsphere_cluster = "RegionA01-K8s"

// Name of the vSphere data center. The dev cluster is "dc1".
vsphere_datacenter = "RegionA01"

// Name of the vSphere data store to use for the VMs. The dev cluster uses "nvme-ds1".
vsphere_datastore = "iscsi"

// Name of the VM template to clone to create VMs for the cluster. The dev cluster has a template named "rhcos-latest".
vm_template = "RH"

// The machine_cidr where IP addresses will be assigned for cluster nodes.
// Additionally, IPAM will assign IPs based on the network ID. 
machine_cidr = "10.114.16.0/24"

// The number of control plane VMs to create. Default is 3.
control_plane_count = 3

// The number of compute VMs to create. Default is 3.
compute_count = 3

// URL of the bootstrap ignition. This needs to be publicly accessible so that the bootstrap machine can pull the ignition.
bootstrap_ignition_url = "http://192.168.110.11/bootstrap.ign"
// Set ipam and ipam_token if you want to use the IPAM server to reserve IP
// addresses for the VMs.

// Address or hostname of the IPAM server from which to reserve IP addresses for the cluster machines.
//ipam = "139.178.89.254"

// Token to use to authenticate with the IPAM server.
//ipam_token = "TOKEN_FOR_THE_IPAM_SERVER"


// Set bootstrap_ip, control_plane_ip, and compute_ip if you want to use static
// IPs reserved someone else, rather than the IPAM server.

// The IP address to assign to the bootstrap VM.
bootstrap_ip = "10.114.16.9"

vm_network = "ocp4-segment"

// The IP addresses to assign to the control plane VMs. The length of this list
// must match the value of control_plane_count.

control_plane_ips = ["10.114.16.10", "10.114.16.11", "10.114.16.12"]

// The IP addresses to assign to the compute VMs. The length of this list must
// match the value of compute_count.
//compute_ips = ["10.0.0.30", "10.0.0.31", "10.0.0.32"]
compute_ips = ["10.114.16.20", "10.114.16.21", "10.114.16.22"]

// Ignition config for the control plane machines. You should copy the contents of the master.ign generated by the installer.
control_plane_ignition = <<END_OF_MASTER_IGNITION
{"ignition":{"config":{"append":[{"source":"https://api-int.oc4.corp.local:22623/config/master","verification":{}}]},"security":{"tls":{"certificateAuthorities":[{"source":"data:text/plain;charset=utf-8;base64,LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFRENDQWZpZ0F3SUJBZ0lJVk10VWQ5a2dEWTR3RFFZSktvWklodmNOQVFFTEJRQXdKakVTTUJBR0ExVUUKQ3hNSmIzQmxibk5vYVdaME1SQXdEZ1lEVlFRREV3ZHliMjkwTFdOaE1CNFhEVEl3TURZeU9URTVNek15T0ZvWApEVE13TURZeU56RTVNek15T0Zvd0pqRVNNQkFHQTFVRUN4TUpiM0JsYm5Ob2FXWjBNUkF3RGdZRFZRUURFd2R5CmIyOTBMV05oTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUF6MHh1SlFFZDl2OXgKd3pXOEl3cDRBdlhPOENpOE9aejIrakJRcVV1T3lRMnpXUWtuQlRPZXlTaDFDcUY4Z2tkUFlwZXhjVFY3SCtEQQp4Y2ZVdDJ4RXd1NzA2am93Lzd1a2QvVFFOZ2Qrdmttd09KT1FxVmhWMlhsOStpN3BUNmxUR0ZibGphdVRrQlpMCnlGYy9WenBhcmhodWZsRlhpTUo1M04wZkxXdXhydWg1QlBSWEhGdWN3Zm9tYXVubzdFSGdIRjZ0bTBxVnM5dmkKR1NORklBZnBNYzczZ014MDdPalowRmxaZ0xYY1VFdk9HVlJWR3FZbjFld0w1Mk5xbjZZazZiZXpnam9TSTV5aAowYUxKQ2hNcnlMVDZBWExxZ0hJdTRreThhSk4xMklEU2RwUFZKeE10RFZlaUhzSngzN2U3Y3k5S3JPdjhKZDRuCmdJclBVVFhYbndJREFRQUJvMEl3UURBT0JnTlZIUThCQWY4RUJBTUNBcVF3RHdZRFZSMFRBUUgvQkFVd0F3RUIKL3pBZEJnTlZIUTRFRmdRVU5RSkhZSGpIZXVTSU5hOXhJTzFzTlJvcFh3UXdEUVlKS29aSWh2Y05BUUVMQlFBRApnZ0VCQUNJbEo1T1FkM2Q3VFFKeDVDQ0J5bXFaYmNrVU1aRVlWVFVKalNIbGNBZ1Q2Z0VhTGlDUWluVUljRE1WCnk3VWt1WnJVZS84YkxWUkNHM1BJaFY5L014amZtL3cvZ3VFc1RQTFJuRDNHT0lJd2lyOGZOUGMxTUx6MldlV0EKeHhSclBwTmtiNmxMRVh5MzJjcVV4SFN6KzNHQTRUNE11c2M3b24wd3ZZN1Z6UXU4NXZ4Zlh5VWloK0c5ck9RYwovSkMyN1BHclI3WFA0NzBzbHRwdG15cnludGVHUnZ2N0NMdEZTVDZEaXVNMFpDRnhhMCtzOXF1RTJkRE80VmxtCmd3eTZMWjV6ZHZIV3g2K1Z1ZGx0VGhHcDNwbmEyTVErY1lXSGp0bUdsYjhQdzdrMGsraW1uNGoxQ2hkL1RWTkgKeXByZEl2VUFoaU0vMnZINmV3b2tYaVFGRjBVPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==","verification":{}}]}},"timeouts":{},"version":"2.2.0"},"networkd":{},"passwd":{},"storage":{},"systemd":{}}
END_OF_MASTER_IGNITION

// Ignition config for the compute machines. You should copy the contents of the worker.ign generated by the installer.
compute_ignition = <<END_OF_WORKER_IGNITION
{"ignition":{"config":{"append":[{"source":"https://api-int.oc4.corp.local:22623/config/worker","verification":{}}]},"security":{"tls":{"certificateAuthorities":[{"source":"data:text/plain;charset=utf-8;base64,LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFRENDQWZpZ0F3SUJBZ0lJVk10VWQ5a2dEWTR3RFFZSktvWklodmNOQVFFTEJRQXdKakVTTUJBR0ExVUUKQ3hNSmIzQmxibk5vYVdaME1SQXdEZ1lEVlFRREV3ZHliMjkwTFdOaE1CNFhEVEl3TURZeU9URTVNek15T0ZvWApEVE13TURZeU56RTVNek15T0Zvd0pqRVNNQkFHQTFVRUN4TUpiM0JsYm5Ob2FXWjBNUkF3RGdZRFZRUURFd2R5CmIyOTBMV05oTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUF6MHh1SlFFZDl2OXgKd3pXOEl3cDRBdlhPOENpOE9aejIrakJRcVV1T3lRMnpXUWtuQlRPZXlTaDFDcUY4Z2tkUFlwZXhjVFY3SCtEQQp4Y2ZVdDJ4RXd1NzA2am93Lzd1a2QvVFFOZ2Qrdmttd09KT1FxVmhWMlhsOStpN3BUNmxUR0ZibGphdVRrQlpMCnlGYy9WenBhcmhodWZsRlhpTUo1M04wZkxXdXhydWg1QlBSWEhGdWN3Zm9tYXVubzdFSGdIRjZ0bTBxVnM5dmkKR1NORklBZnBNYzczZ014MDdPalowRmxaZ0xYY1VFdk9HVlJWR3FZbjFld0w1Mk5xbjZZazZiZXpnam9TSTV5aAowYUxKQ2hNcnlMVDZBWExxZ0hJdTRreThhSk4xMklEU2RwUFZKeE10RFZlaUhzSngzN2U3Y3k5S3JPdjhKZDRuCmdJclBVVFhYbndJREFRQUJvMEl3UURBT0JnTlZIUThCQWY4RUJBTUNBcVF3RHdZRFZSMFRBUUgvQkFVd0F3RUIKL3pBZEJnTlZIUTRFRmdRVU5RSkhZSGpIZXVTSU5hOXhJTzFzTlJvcFh3UXdEUVlKS29aSWh2Y05BUUVMQlFBRApnZ0VCQUNJbEo1T1FkM2Q3VFFKeDVDQ0J5bXFaYmNrVU1aRVlWVFVKalNIbGNBZ1Q2Z0VhTGlDUWluVUljRE1WCnk3VWt1WnJVZS84YkxWUkNHM1BJaFY5L014amZtL3cvZ3VFc1RQTFJuRDNHT0lJd2lyOGZOUGMxTUx6MldlV0EKeHhSclBwTmtiNmxMRVh5MzJjcVV4SFN6KzNHQTRUNE11c2M3b24wd3ZZN1Z6UXU4NXZ4Zlh5VWloK0c5ck9RYwovSkMyN1BHclI3WFA0NzBzbHRwdG15cnludGVHUnZ2N0NMdEZTVDZEaXVNMFpDRnhhMCtzOXF1RTJkRE80VmxtCmd3eTZMWjV6ZHZIV3g2K1Z1ZGx0VGhHcDNwbmEyTVErY1lXSGp0bUdsYjhQdzdrMGsraW1uNGoxQ2hkL1RWTkgKeXByZEl2VUFoaU0vMnZINmV3b2tYaVFGRjBVPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==","verification":{}}]}},"timeouts":{},"version":"2.2.0"},"networkd":{},"passwd":{},"storage":{},"systemd":{}}
END_OF_WORKER_IGNITION

