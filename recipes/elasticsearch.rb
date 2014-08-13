#
# Cookbook Name:: elasticsearch-aio
# Recipe:: elasticsearch
#
# Copyright 2013, Kazuto Kusama @jacopen
#

config = node[:elasticsearch_aio]

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

bash "Uninstall elasticsearch-head" do
  code "/usr/share/elasticsearch/bin/plugin -remove mobz/elasticsearch-head"
  user "root"
  group "root"
  only_if "/usr/share/elasticsearch/bin/plugin --list | grep head"
end

bash "Uninstall Kibana" do
  code "/usr/share/elasticsearch/bin/plugin -remove elasticsearch/kibana3"
  user "root"
  group "root"
  only_if "/usr/share/elasticsearch/bin/plugin --list | grep kibana"
end

bash "Install elasticsearch-head" do
  code "/usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head"
  user "root"
  group "root"
end

bash "Install Kibana" do
  code "/usr/share/elasticsearch/bin/plugin -url http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip -install elasticsearch/kibana3"
  user "root"
  group "root"
end

service "elasticsearch" do
  supports [:restart]
  action [:enable, :start]
end
