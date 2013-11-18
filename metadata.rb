name             'es_with_fluentd'
maintainer       'Kazuto Kusama'
maintainer_email 'jacopen@gmail.com'
license          'All rights reserved'
description      'Installs/Configures Elasticsearch, Fluentd(td-agent), Kibana and Elasticsearch Head'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends "apt"
depends "td-agent"
depends "nginx"
