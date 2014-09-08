include_recipe "monit"

template "/etc/monit/conf.d/elasticsearch.conf" do
  source "monit_elasticsearch.conf.erb"
  owner "root"
  group "root"
end

monit "elasticsearch"
