#
# Cookbook Name:: es-with-fluentd
# Recipe:: default
#
# Copyright 2013, Kazuto Kusama @jacopen
#

include_recipe "apt"
include_recipe "td-agent"
include_recipe "nginx"

config = node[:es_with_fluentd]

%w(openjdk-7-jdk git curl unzip).each do |pkg|
  package pkg
end

remote_file "/tmp/#{config[:es_deb_filename]}" do
  source config[:es_base_url] + config[:es_deb_filename]
  action :create_if_missing
end

dpkg_package "/tmp/#{config[:es_deb_filename]}" do
  action :install
end

remote_file "/tmp/kibana-latest.zip" do
  source config[:kibana][:zip]
end

bash "extract kibana" do
  code "unzip -o /tmp/kibana-latest.zip -d /var/www"
end

git "/var/www/eh" do
  repository config[:elasticsearch_head][:git]
  action :sync
  notifies :restart, "service[nginx]"
end

template "/etc/elasticsearch/elasticsearch.yml" do
  notifies :restart, "service[elasticsearch]"
end

template "/etc/td-agent/td-agent.conf" do
  notifies :restart, "service[td-agent]"
end

template "/etc/nginx/sites-available/kibana" do
  notifies :restart, "service[nginx]"
end

link File.join("/etc/nginx/sites-available/kibana") do
  to File.join("/etc/nginx/sites-enabled/kibana")
end

file "/var/log/fluentd-kibana" do
  action :touch
  owner "td-agent"
  group "td-agent"
end

file "/var/log/syslog" do
  action :touch
  mode "0644"
end

service "elasticsearch" do
  supports [:restart]
  action :enable
end

service "nginx" do
  supports [:restart, :reload]
  action :enable
end

service "td-agent" do
  supports [:restart, :reload]
  action :enable
end
