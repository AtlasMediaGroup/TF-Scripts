#!
if screen -list | grep -q "TotalFreedom";
then
    screen -X -S "TotalFreedom" stuff "stop^M"
    sleep 5
else
    echo "The server is not running... Try starting it <3"
fi

if screen -list | grep -q "TotalFreedom";
then
    screen -X -S "TotalFreedom" stuff "^C"
    sleep 5
fi

if screen -list | grep -q "TotalFreedom";
then
    screen -X -S "TotalFreedom" stuff "^C^C^C^C^C^C^C^C"
fi

if screen -list | grep -q "TotalFreedom";
then
    echo "Graceful Shutdown Failed. Please run tf!kill"
fi