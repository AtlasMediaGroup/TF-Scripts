#!
sleep 10
if screen -list | grep -q "TotalFreedom";
then
    screen -X -S "TotalFreedom" stuff "stop^M"
    sleep 5
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

if screen -list | grep -q "TotalFreedom";
then
    echo "ERROR - We have been unable to re-start the server... Please execute this manually"
else
    screen -dmS TotalFreedom java -Xms18G -Xmx18G -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10 -jar paperclip.jar
    echo "Server Started"
fi
