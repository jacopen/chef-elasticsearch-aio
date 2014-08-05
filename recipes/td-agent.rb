include_recipe "td-agent"

directory "/etc/td-agent/conf.d" do
  owner "root"
  group "root"
  action :create
  not_if { File.exist? "/etc/td-agent/conf.d" }
end

template "/etc/td-agent/td-agent.conf" do
  source "td-agent.conf.erb"
  owner "root"
  group "root"
  notifies :restart, "service[td-agent]"
end

template "/etc/td-agent/conf.d/elasticsearch.conf" do
  source "elasticsearch.conf.erb"
  owner "root"
  group "root"
  notifies :restart, "service[td-agent]"
end

service "td-agent" do
  supports [:restart, :reload]
  action :enable
end
