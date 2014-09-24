package "curl"

sp = node[:elasticsearch_aio][:snapshot]

bash "Create repository" do
  code <<-EOC
    while true; do
      curl '#{sp[:host]}:#{sp[:port]}'
      [ $? -eq 0 ] && break
      [ $count -eq 20 ] && exit 5

      echo "elasticsearch take a long time to start. sleep 10s..."
      sleep 10
      count=`expr $count + 1`
    done

    res=`curl -s -XPUT '#{sp[:host]}:#{sp[:port]}/_snapshot/#{sp[:repository]}' -d '{
      "type": "s3",
      "settings": {
          "bucket"      : "#{sp[:bucket]}",
          "compress"    : true,
          "max_retries" : #{sp[:retry]}
      }
    }'`

    # Chef error(6) when create repository failed.
    [ $res = '{"acknowledged":true}' ] || exit 6
  EOC
  user "root"
end

bash "Install curator" do
  code "source /etc/profile.d/pyenv.sh; pip install elasticsearch-curator; pyenv rehash"
  user "root"
end


## cron
user = sp[:user]
curator = "curator --host #{sp[:host]} --port #{sp[:port]} --timeout #{sp[:timeout]}"

save_snapshot_command   = "source /etc/profile.d/pyenv.sh"
delete_snapshot_command = "source /etc/profile.d/pyenv.sh"
delete_index_command    = "source /etc/profile.d/pyenv.sh"

sp[:prefixes].each do |prefix|
  save_snapshot_command   += "; #{curator} snapshot --older-than #{sp[:save_snapshot][:older_than]} " \
                                  + "--repository #{sp[:repository]} --prefix #{prefix} >> #{sp[:save_snapshot][:log]} 2>&1"

  delete_snapshot_command += "; #{curator} snapshot --delete-older-than #{sp[:delete_snapshot][:older_than]} " \
                                  + "--repository #{sp[:repository]} --prefix #{prefix} >> #{sp[:delete_snapshot][:log]} 2>&1"

  delete_index_command    += "; #{curator} delete --older-than #{sp[:delete_index][:older_than]} " \
                                  + "--prefix #{prefix} >> #{sp[:delete_index][:log]} 2>&1"
end

cron "save_snapshot" do
  command "bash -c '#{save_snapshot_command}'"
  user user
  minute  "#{sp[:save_snapshot][:minute]}"
  hour    "#{sp[:save_snapshot][:hour]}"
  day     "#{sp[:save_snapshot][:day]}"
  month   "#{sp[:save_snapshot][:month]}"
  weekday "#{sp[:save_snapshot][:weekday]}"
end

cron "delete_snapshot" do
  command "bash -c '#{delete_snapshot_command}'"
  user user
  minute  "#{sp[:delete_snapshot][:minute]}"
  hour    "#{sp[:delete_snapshot][:hour]}"
  day     "#{sp[:delete_snapshot][:day]}"
  month   "#{sp[:delete_snapshot][:month]}"
  weekday "#{sp[:delete_snapshot][:weekday]}"
end

cron "delete_index" do
  command "bash -c '#{delete_index_command}'"
  user user
  minute  "#{sp[:delete_index][:minute]}"
  hour    "#{sp[:delete_index][:hour]}"
  day     "#{sp[:delete_index][:day]}"
  month   "#{sp[:delete_index][:month]}"
  weekday "#{sp[:delete_index][:weekday]}"
end
