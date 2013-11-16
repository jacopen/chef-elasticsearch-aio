#
# Cookbook Name:: es-with-fluentd
# Recipe:: default
#
# Copyright 2013, Kazuto Kusama @jacopen
#

config = node[:es_with_fluentd]

package "openjdk-7-jdk"

remote_file "/tmp/#{config[:es_deb_filename]}" do
  source config[:es_base_url] + config[:es_deb_filename]
  action :create_if_missing
end

dpkg_package "/tmp/#{config[:es_deb_filename]}" do
  action :install
end

template "/etc/elasticsearch/elasticsearch.yml"

service "elasticsearch" do
  action :restart
end
