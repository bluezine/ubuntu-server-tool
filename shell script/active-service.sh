#/bin/bash
service=$1
status=$(systemctl status $service | awk '/Active/{print $2}')
  
if [ "$status" ];
then
        if [ "$status" == "active" ];
        then
                echo "Already"
        else
                /usr/bin/systemctl restart $service
        fi
fi
exit 0
