include_recipe "td-agent"

td_agent_gem "kibana-server" do
  version "0.0.2"
  plugin true
end

directory "/etc/td-agent/conf.d" do
  owner "root"
  group "root"
  action :create
  not_if { File.exist? "/etc/td-agent/conf.d" }
end

directory "/var/log/kibana" do
  action :create
  owner "td-agent"
  group "td-agent"
end

template "/etc/td-agent/td-agent.conf" do
  source "td-agent.conf.erb"
  owner "root"
  group "root"
  notifies :restart, "service[td-agent]"
end

template "/etc/td-agent/conf.d/kibana.conf" do
  source "kibana.conf.erb"
  owner "root"
  group "root"
  notifies :restart, "service[td-agent]"
end

execute "change permission" do
  command "chown -R td-agent: /usr/lib/fluent/ruby/lib/ruby/gems/1.9.1/gems/fluent-plugin-kibana-server-*"
end

service "td-agent" do
  supports [:restart, :reload]
  action :enable
end
