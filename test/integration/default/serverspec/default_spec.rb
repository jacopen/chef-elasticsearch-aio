require 'spec_helper'

%w{
  elasticsearch
  td-agent
  rsyslog
  monit
}.each do |service|
  describe service(service) do
    it { should be_running }
  end
end

describe file('/etc/monit/conf.d/elasticsearch.conf') do
  it { should be_file }
end

# elasticsearch
describe port(9200) do
  it { should be_listening }
end

describe file('/usr/local/pyenv/shims/curator') do
  it { should be_file }
end
