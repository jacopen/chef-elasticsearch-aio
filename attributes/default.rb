config = default[:es_with_fluentd]
config[:es_base_url]       = "https://download.elasticsearch.org/elasticsearch/elasticsearch/"
config[:es_deb_filename]   = "elasticsearch-0.90.7.deb"
config[:cluster_name]      = "es_with_fluentd"
config[:node_master]       = "true"
config[:node_data]         = "true"

config[:index_number_of_shards]    = "5"
config[:index_number_of_replicas]  = "1"

config[:gateway_type]         = "local"

### optional values ###
# config[:node_name]                   = "node001"
# config[:plugins_mandatory]           = "plugin name"
# config[:bootstrap_mlockall]          = "true"
# config[:gateway_recover_after_nodes] = "1"
# config[:gateway_recover_after_time]  = "5m"
# config[:gateway_expected_nodes]      = "2"
