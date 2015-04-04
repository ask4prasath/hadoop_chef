#
# Cookbook Name:: rhea_chef_repo
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "zookeeper"

service 'zookeeper' do  
  provider Chef::Provider::Service::Upstart
  start_command "/opt/zookeeper/zookeeper-3.4.6/bin/zkServer.sh start"
  action [:start]
end
