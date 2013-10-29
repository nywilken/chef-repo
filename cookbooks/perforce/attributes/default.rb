# Perforce User/Group Attributes
default[:perforce][:user] = "perforce"
default[:perforce][:uid] = "2001"
default[:perforce][:fullname] = "Perforce Admin User"
default[:perforce][:shell] = "/bin/bash"
default[:perforce][:home] = "/p4"
default[:perforce][:group] = "p4admin"
default[:perforce][:gid] = "2001"
# Perforce File Structure
default[:perforce][:db_dir] = "/metadata"
default[:perforce][:log_dir] = "/log"
default[:perforce][:depot_dir] = "/depotdata"
default[:perforce][:db_mnt_device] = "/dev/xvdf"
default[:perforce][:log_mnt_device] = "/dev/xvdg"
default[:perforce][:depot_mnt_device] = "/dev/xvdh"
# Perforce Binaries
default[:perforce][:pkg_version] = "r13.1"