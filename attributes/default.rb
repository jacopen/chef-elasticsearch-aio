es = default[:es_with_fluentd]
es[:es_base_url]              = "https://download.elasticsearch.org/elasticsearch/elasticsearch/"
es[:es_deb_filename]          = "elasticsearch-0.90.7.deb"
es[:nginx][:port]             = 28080
es[:nginx][:server_name]      = "elasticsearch.example.com"
es[:elasticsearch_head][:git] = "https://github.com/mobz/elasticsearch-head.git"
es[:kibana][:zip]             = "http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip"

conf = es[:config]

## These attributes are export to elasticsearch.yml.
## e.g.
## conf[:cluster][:name] = "elasticsearch"
## 
## # in elasticsearch.yml
## cluster.name = "elasticsearch"
##

# conf[:cluster][:name]                  = "elasticsearch"
# conf[:node][:name]                     = "Franz Kafka"
# conf[:node][:master]                   = true
# conf[:node][:data]                     = true
# conf[:node][:rack]                     = "rack314"
# conf[:node][:max_local_storage_nodes]  = 1
# conf[:index][:number_of_shards]        = 5
# conf[:index][:number_of_replicas]      = 1
# conf[:path][:conf]                     = "/path/to/conf"
# conf[:path][:data]                     = "/path/to/data"
# conf[:path][:work]                     = "/path/to/work"
# conf[:path][:logs]                     = "/path/to/logs"
# conf[:path][:plugins]                  = "/path/to/plugins"
# conf[:plugin][:mandatory]              = " mapper-attachments,lang-groovy"
# conf[:bootstrap][:mlockall]            = true
# conf[:network][:bind_host]             = "192.168.0.1"
# conf[:network][:publish_host]          = "192.168.0.1"
# conf[:network][:host]                  = "192.168.0.1"
# conf[:transport][:tcp][:port]          = 9300
# conf[:transport][:tcp][:compress]      = true
# conf[:http][:port]                     = 9200
# conf[:http][:max_content_length]       = "100mb"
# conf[:http][:enabled]                  = false
# conf[:gateway][:type]                  = "local"
# conf[:gateway][:recover_after_nodes]   = 1
# conf[:gateway][:recover_after_time]    = "5m"
# conf[:gateway][:expected_nodes]        = 2
# conf[:cluster][:routing][:allocation][:node_initial_primaries_recoveries] = 4
# conf[:cluster][:routing][:allocation][:node_concurrent_recoveries] = 2
# conf[:indices][:recovery][:max_bytes_per_sec]       = "20mb"
# conf[:indices][:recovery][:concurrent_streams]      = 5
# conf[:discovery][:zen][:minimum_master_nodes]       = 1
# conf[:discovery][:zen][:ping][:timeout]             = "3s"
# conf[:discovery][:zen][:ping][:multicast][:enabled] = false
# conf[:discovery][:zen][:ping][:unicast][:hosts]     = ["host1", "host2:port"]
# 
# conf[:index][:search][:slowlog][:threshold][:query][:warn]    = "10s"
# conf[:index][:search][:slowlog][:threshold][:query][:info]    = "5s"
# conf[:index][:search][:slowlog][:threshold][:query][:debug]   = "2s"
# conf[:index][:search][:slowlog][:threshold][:query][:trace]   = "500ms"
# conf[:index][:search][:slowlog][:threshold][:fetch][:warn]    = "1s"
# conf[:index][:search][:slowlog][:threshold][:fetch][:info]    = "800ms"
# conf[:index][:search][:slowlog][:threshold][:fetch][:debug]   = "500ms"
# conf[:index][:search][:slowlog][:threshold][:fetch][:trace]   = "200ms"
# conf[:index][:indexing][:slowlog][:threshold][:index][:warn]  = "10s"
# conf[:index][:indexing][:slowlog][:threshold][:index][:info]  = "5s"
# conf[:index][:indexing][:slowlog][:threshold][:index][:debug] = "2s"
# conf[:index][:indexing][:slowlog][:threshold][:index][:trace] = "500ms"
# conf[:monitor][:jvm][:gc][:ParNew][:warn]  = "1000ms"
# conf[:monitor][:jvm][:gc][:ParNew][:info]  = "700ms"
# conf[:monitor][:jvm][:gc][:ParNew][:debug] = "400ms"
# conf[:monitor][:jvm][:gc][:ConcurrentMarkSweep][:warn]  = "10s"
# conf[:monitor][:jvm][:gc][:ConcurrentMarkSweep][:info]  = "5s"
# conf[:monitor][:jvm][:gc][:ConcurrentMarkSweep][:debug] = "2s"

