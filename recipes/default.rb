#
# Cookbook Name:: elasticsearch-aio
# Recipe:: default
#
# Copyright 2013, Kazuto Kusama @jacopen
#

include_recipe "elasticsearch-aio::td-agent"
include_recipe "elasticsearch-aio::elasticsearch"
