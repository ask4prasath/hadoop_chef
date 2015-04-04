#
# Cookbook Name:: rhea_chef_repo
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "zookeeper"

template "/opt/zookeeper/zookeeper-3.4.6/conf/zoo.cfg" do
	source "zookeeper_config.erb"
	notifies :restart, "service[zookeeper]", :delayed
end 	

service 'zookeeper' do  
  provider Chef::Provider::Service::Upstart
  start_command "/opt/zookeeper/zookeeper-3.4.6/bin/zkServer.sh start"
  restart_command "/opt/zookeeper/zookeeper-3.4.6/bin/zkServer.sh restart"
  action [:start]
end
