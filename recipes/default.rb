#
# Cookbook Name:: elasticsearch-aio
# Recipe:: default
#
# Copyright 2013, Kazuto Kusama @jacopen
#

%w(openjdk-7-jdk git curl unzip libcurl3 libcurl3-gnutls libcurl4-openssl-dev libcurl4-gnutls-dev libcurl4-nss-dev build-essential).each do |pkg|
  package pkg
end

include_recipe "elasticsearch-aio::td-agent"
include_recipe "elasticsearch-aio::elasticsearch"
include_recipe "elasticsearch-aio::vcap"
include_recipe "elasticsearch-aio::monit"
