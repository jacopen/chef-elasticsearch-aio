name             'elasticsearch-aio'
maintainer       'Kazuto Kusama'
maintainer_email 'jacopen@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures Elasticsearch, td-agent, Kibana and Elasticsearch Head'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.0'

depends "apt"
depends "td-agent"
depends "monit"

recipe "elasticsearch-aio", "setup all in one"
recipe "elasticsearch-aio::elasticsearch", "setup elasticsearch and plugins"
recipe "elasticsearch-aio::td-agent", "setup td-agent and plugins"
recipe "elasticsearch-aio::vcap", "config rsyslog for vcap components"
recipe "elasticsearch-aio::monit", "setup monit"
