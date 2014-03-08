#
# Cookbook Name:: simplicity
# Recipe:: software
#
# Copyright 2013, Wilken Rivera <wrivera00 at gmail dot com>
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

include_recipe "simplicity::ppas"

# System Utilities and Libraries
%w{build-essential libssl-dev tree telnet nmap htop curl libxml2 libxml2-dev libxslt1-dev }.each do |pkg|
  package pkg do
    action :install
  end
end

# Development
%w{git-core gitg vim zsh tmux xclip}.each do |pkg|
  package pkg do
    action :install
  end
end

# Desktop Applications
%w{thunderbird filezilla}.each do |pkg|
  package pkg do
    action :install
  end
end

