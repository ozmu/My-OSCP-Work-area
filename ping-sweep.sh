#/bin/bash
clear
echo "This script is send ping to all subnetwork."
for i in `seq 1 255`
do
  command=$(ping 192.168.2.$i -c 1 | tr \\n " " | cut -d ',' -f 2 | awk '{print $1}')
  if [ $command -eq 1 ]
    then
      echo "192.168.2.$i is working."
    else
      echo "192.168.2.$i is not working."
  fi
done
