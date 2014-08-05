#
# Cookbook Name:: elasticsearch-aio
# Recipe:: vcap
#
# Copyright 2014, Kazuto Kusama @jacopen
#

package "rsyslog-relp"

template "/etc/rsyslog.d/70-vcap.conf" do
  notifies :restart, "service[rsyslog]"
end

service "rsyslog" do
  supports [:restart]
  action :enable
end
