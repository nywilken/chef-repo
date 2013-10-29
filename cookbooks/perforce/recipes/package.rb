remote_file "Download P4d binary" do
	source "ftp://ftp.perforce.com/perforce/#{node[:perforce][:pkg_version]}/bin.linux26x86_64/p4d"
	path "#{node[:perforce][:home]}/bin"
	owner node[:perforce][:user]
	group node[:perforce][:group]
	mode 00777
	action :create_if_missing
end

remote_file "Download P4 binary" do
	source "ftp://ftp.perforce.com/perforce/#{node[:perforce][:pkg_version]}/bin.linux26x86_64/p4"
	path "#{node[:perforce][:home]}/bin"
	owner node[:perforce][:user]
	group node[:perforce][:group]
	mode 00777
	action :create_if_missing
end