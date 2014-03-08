root = File.absolute_path(File.dirname(__FILE__))

cookbook_path root + '/cookbooks'
role_path root + '/roles'
data_bag_path + '/databags'

solo true

log_level :info
log_location "/tmp/chef-run.log"
verbose_logging true
