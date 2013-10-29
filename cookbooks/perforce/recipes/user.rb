# user.rb
group node[:perforce][:group] do
  gid node[:perforce][:gid]
end

user node[:perforce][:user] do
	comment node[:perforce][:fullname]
	uid node[:perforce][:uid]
	gid node[:perforce][:group]
	home node[:perforce][:home]
	shell node[:perforce][:shell]
	supports :manage_home => true
end

template "#{node[:perforce][:home]}/.bash_profile" do
	source "perforce.profile.erb"
	owner node[:perforce][:user]
	group node[:perforce][:group]
end