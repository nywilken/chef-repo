default[:torquebox][:dir]	= "/opt/torquebox"
default[:torquebox][:log_dir]   = "/var/log/torquebox"
default[:torquebox][:home]	= "/opt/torquebox/current"
default[:torquebox][:conf_dir]  = "/etc/profile.d"
override[:torquebox][:app_dir]   = "/vagrant"
override[:torquebox][:bind_addr] = "0.0.0.0"
override[:torquebox][:bind_port] = "3000"
override[:torquebox][:user]      = "vagrant"

