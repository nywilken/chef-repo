#
# Cookbook Name:: torquebox
# Recipe:: default
#
# Copyright 2013, Wilken Rivera
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
package "openjdk-7-jdk" do
  action :install
end

package "unzip" do 
  action :install
end

package "build-essential" do
  action :install
end

directory node[:torquebox][:dir] do
  owner "vagrant"
  mode "0755"
  action :create
end

ENV['TORQUEBOX_DIR'] = node[:torquebox][:dir]
ENV['TORQUEBOX_HOME'] = node[:torquebox][:home]

bash "install_torquebox" do
  cwd node[:torquebox][:dir]
  code <<-EOH
    /usr/bin/wget -N http://torquebox.org/release/org/torquebox/torquebox-dist/2.3.0/torquebox-dist-2.3.0-bin.zip
    /usr/bin/unzip -q torquebox-dist-2.3.0-bin.zip 
    /bin/ln -s torquebox-2.3.0 $TORQUEBOX_HOME
    /bin/chown -R vagrant:vagrant $TORQUEBOX_DIR
  EOH
  creates node[:torquebox][:home] 
end

template "torquebox.profile" do
  path "#{node[:torquebox][:conf_dir]}/torquebox.sh"
  source "torquebox.profile.erb"
  owner "root"
  group "root"
  mode "0644"
end

bash "run_bundle_install" do
  cwd node[:torquebox][:app_dir]
  code <<-EOH
    $TORQUEBOX_HOME/jruby/bin/bundle install
    RUBY_VERSION=$(ruby -v | awk '{print $2}'|sed s'/\.//g')
    [[ $RUBY_VERSION -gt 187 ]] && [[ $RUBY_VERSION -lt 192 ]] && gem install \
    $TORQUEBOX_HOME/jruby/bin/rdoc-data; rdoc-data --install
  EOH
end

bash "torquebox_deploy" do
  cwd node[:torquebox][:app_dir]
  code <<-EOH
    torquebox deploy
  EOH
end

bash "torquebox_run" do
  cwd node[:torquebox][:app_dir]
  code <<-EOH
    torquebox run -p 3000 -b 0.0.0.0 
  EOH
end
