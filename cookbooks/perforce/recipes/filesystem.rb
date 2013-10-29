package "xfsprogs"

directory node[:perforce][:db_dir] do
	owner node[:perforce][:user]
	group node[:perforce][:group]
	mode 00775
	action :create
end

directory node[:perforce][:log_dir] do
	owner node[:perforce][:user]
	group node[:perforce][:group]
	mode 00775
	action :create
end

directory node[:perforce][:depot_dir] do
	owner node[:perforce][:user]
	group node[:perforce][:group]
	mode 00775
	action :create
end

if File.exists? node[:perforce][:db_mnt_device] and File.blockdev? node[:perforce][:db_mnt_device]
	mount node[:perforce][:db_dir] do
		device node[:perforce][:db_mnt_device]
		fstype "xfs"
		action [:mount, :enable]
	end
end

if File.exists? node[:perforce][:log_mnt_device] and File.blockdev? node[:perforce][:log_mnt_device]
	mount node[:perforce][:log_dir] do
		device node[:perforce][:log_mnt_device]
		fstype "xfs"
		action [:mount, :enable]
	end
end
if File.exists? node[:perforce][:depot_mnt_device] and File.blockdev? node[:perforce][:depot_mnt_device]
	mount node[:perforce][:depot_dir] do
		device node[:perforce][:depot_mnt_device]
		fstype "xfs"
		action [:mount, :enable]
	end
end

# link "create p4 root symlink" do
# 	target_file "#{node[:perforce][:user]}/root"
# 	to node[:perforce][:db_dir]
# 	owner node[:perforce][:user]
# 	group node[:perforce][:group]
# end

# link "create p4 logs symlink" do
# 	target_file "#{node[:perforce][:user]}/logs"
# 	to node[:perforce][:log_dir]
# 	owner node[:perforce][:user]
# 	group node[:perforce][:group]
# end
