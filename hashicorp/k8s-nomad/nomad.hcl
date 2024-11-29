# Full configuration options can be found at https://www.nomadproject.io/docs/configuration
datacenter = "dc1"
name = "nomad-container"

plugin_dir = "/opt/nomad/plugins"
data_dir  = "/opt/nomad/data"
log_file = "/opt/nomad/log/nomad.log"
bind_addr = "0.0.0.0"
# enable_syslog = true
# enable_debug = true


server {
  # license_path is required for Nomad Enterprise as of Nomad v1.1.1+
  #license_path = "/etc/nomad.d/license.hclic"
  enabled          = true
  bootstrap_expect = 1

  # This is the IP address of the first server provisioned
  server_join {
    retry_join = ["127.0.0.1:4648"]
    retry_max = 3
    retry_interval = "15s"
  }
}


client {
  enabled = true
  template {
    disable_file_sandbox = true
  }
  servers = ["127.0.0.1"]
}

plugin "nomad-driver-podman" {
  config {
    volumes {
      enabled      = true
      selinuxlabel = "z"
    }
  }
}
