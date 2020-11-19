# WAN connection monitor 

maxPloss1=100 #No route at all
maxPloss2=90 #Maximum package loss before a restart
maxPloss3=50 #Maximum package loss before notify mail

# Set value in case upon ping error
ploss=101

# Ping google IP for 10 seconds and count packet loss
ploss=$(ping -q -w10 8.8.8.8 | grep -o "[0-9]*%" | tr -d %) > /dev/null 2>&1

# Restart if ping gives 100% packet loss
if [ "$ploss" -eq "$maxPloss1" ]; then
       echo "first"
        exit
fi

if [ "$ploss" -gt "$maxPloss2" ]; then
        echo "sec"
        exit
fi

if [ "$ploss" -gt "$maxPloss3" ]; then
         echo "third"
         exit
fi

if [ "$ploss" -eq 0 ]; then
         echo "fourth"
fi