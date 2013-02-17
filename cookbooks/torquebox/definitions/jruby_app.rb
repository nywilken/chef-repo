#
# Cookbook Name:: torquebox
# Definition:: jruby_app
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
define :jruby_app, :env => "development", :enable => true do
  include_recipe "torquebox"

  application_name = params[:name]
  application_dir  = params[:approot]

  if params[:enable]
     execute "create development-db" do
         command "su -l #{node[:torquebox][:user]} -c '#{node[:torquebox][:home]}/jruby/bin/rake db:migrate --rakefile=#{application_dir}/Rakefile'"
    end

    execute "torquebox deploy #{application_name}" do
        command "su -l #{node[:torquebox][:user]} -c '#{node[:torquebox][:home]}/jruby/bin/bundle install --quiet --gemfile=#{application_dir}/Gemfile && #{node[:torquebox][:home]}/jruby/bin/torquebox deploy #{params[:approot]} --name=#{params[:name]} --env=#{params[:env]}'"  
    end
  else
    execute "torquebox undeploy #{application_name}" do
        command "su -l #{node[:torquebox][:user]} -c '#{node[:torquebox][:home]}/jruby/bin/torquebox undeploy #{params[:approot]} --name=#{params[:name]}'" 
    end
    if ::File.exists?("#{node[:torquebox][:home]}/jboss/standalone/deployment/#{application_name}-knob.yml.undeployed")
      execute "su -l #{node[:torquebox][:user]} -c '/bin/rm #{node[:torquebox][:home]}/jboss/standalone/deployment/#{application_name}-knob.yml.undeployed'"
    end
  end
end
