es = default[:elasticsearch_aio]
es[:es_base_url]              = "https://download.elasticsearch.org/elasticsearch/elasticsearch/"
es[:es_deb_filename]          = "elasticsearch-1.3.1.deb"
es[:cloud_aws][:version]      = "2.3.0"

es[:td_agent][:http][:enabled]       = "true"
es[:td_agent][:http][:port]          = "8888"
es[:td_agent][:syslog][:port]        = "15140"
es[:rsyslog][:port]                  = "10010"
es[:nginx][:port]                    = "80"
es[:nginx][:sites_path]              = "/var/www"

es[:snapshot][:user]                  = "vagrant"
es[:snapshot][:host]                  = "localhost"
es[:snapshot][:port]                  = 9200
es[:snapshot][:bucket]                = "xxxxx"
es[:snapshot][:repository]            = "my_backup_repository"
es[:snapshot][:retry]                 = 30  # count
es[:snapshot][:timeout]               = 300 # s

es[:snapshot][:prefixes] = [ "logstash-", ".marvel-" ]

es[:snapshot][:save_snapshot][:log]          = "$HOME/curator_save_snapshot.log"
es[:snapshot][:save_snapshot][:older_than]   = 1 # days
es[:snapshot][:save_snapshot][:minute]       = "1"
es[:snapshot][:save_snapshot][:hour]         = "1"
es[:snapshot][:save_snapshot][:day]          = "1"
es[:snapshot][:save_snapshot][:month]        = "1"
es[:snapshot][:save_snapshot][:weekday]      = "*"

es[:snapshot][:delete_snapshot][:log]        = "$HOME/curator_delete_snapshot.log"
es[:snapshot][:delete_snapshot][:older_than] = 90 # days
es[:snapshot][:delete_snapshot][:minute]     = "2"
es[:snapshot][:delete_snapshot][:hour]       = "2"
es[:snapshot][:delete_snapshot][:day]        = "2"
es[:snapshot][:delete_snapshot][:month]      = "2"
es[:snapshot][:delete_snapshot][:weekday]    = "*"

es[:snapshot][:delete_index][:log]           = "$HOME/curator_delete_index.log"
es[:snapshot][:delete_index][:older_than]    = 7 # days
es[:snapshot][:delete_index][:minute]        = "3"
es[:snapshot][:delete_index][:hour]          = "3"
es[:snapshot][:delete_index][:day]           = "3"
es[:snapshot][:delete_index][:month]         = "3"
es[:snapshot][:delete_index][:weekday]       = "*"

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
conf[:index][:number_of_shards]        = 5
conf[:index][:number_of_replicas]      = 0
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
conf[:http][:port]                     = 9200
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

# conf[:cloud][:aws][:access_key]    = "__AWS_ACCESS_KEY__"
# conf[:cloud][:aws][:secret_key]    = "__AWS_SECRET_KEY__"
# conf[:cloud][:aws][:s3][:endpoint] = "__AWS_S3_ENDPOINT__"
