# add pending check to monit
define :monit, :action => 'restart' do

  execute "#{params[:action]}_#{params[:name]}" do
    command <<-EOF
      COUNT=0
      while true; do
        monit reload
        sleep 10

        monit summary | egrep "Process '#{params[:name]}'"
        if [ $? -eq 0 ]; then
          break
        fi

        if [ $COUNT -eq 20 ]; then
          exit 3
        fi

        COUNT=`expr $COUNT + 1`
        echo "process #{params[:name]} not found. wait 10s..."
      done

      COUNT=0
      while true; do
        monit summary | egrep "Process '#{params[:name]}'" | egrep "(start|stop|restart) pending"
        if [ $? -ne 0 ]; then
          monit #{params[:action]} #{params[:name]}
          if [ $? -eq 0 ]; then
            break
          fi
          exit 1
        fi

        if [ $COUNT -eq 20 ]; then
          exit 2
        fi

        COUNT=`expr $COUNT + 1`
        echo "process #{params[:name]} is pending now. wait 10s..."
        sleep 10
      done
    EOF
    user "root"
    action :run
  end

end
