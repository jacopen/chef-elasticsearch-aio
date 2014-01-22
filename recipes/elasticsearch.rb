#
# Cookbook Name:: elasticsearch-aio
# Recipe:: elasticsearch
#
# Copyright 2013, Kazuto Kusama @jacopen
#

include_recipe "elasticsearch-aio::td-agent"

config = node[:elasticsearch_aio]

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

template "/etc/elasticsearch/elasticsearch.yml" do
  notifies :restart, "service[elasticsearch]"
end

service "elasticsearch" do
  supports [:restart]
  action :enable
end
