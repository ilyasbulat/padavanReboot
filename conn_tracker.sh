# WAN connection monitor 

maxPloss1=100 #No route at all
maxPloss2=90 #Maximum package loss before a restart

restart_networking() {
      
        echo 0 > /sys/bus/usb/devices/1-1/authorized
        sleep 3
        echo 1 > /sys/bus/usb/devices/1-1/authorized

}

# Set value in case upon ping error
ploss=101

# Ping google IP for 10 seconds and count packet loss
ploss=$(ping -q -w10 8.8.8.8 | grep -o "[0-9]*%" | tr -d %) > /dev/null 2>&1

if [ -z "$ploss" ]; then                             
                                                             
                                                                             
        restart_networking                           
        #Exiting the script                                                  
        exit                 
fi  
# Restart if ping gives 100% packet loss
if [ "$ploss" -eq "$maxPloss1" ]; then
       
        restart_networking
        #Exiting the script
        exit
fi

if [ "$ploss" -gt "$maxPloss2" ]; then
        #Make a note in syslog
       
        restart_networking
        #Exiting the script
        exit
fi

