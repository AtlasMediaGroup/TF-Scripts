#!
if screen -list | grep -q "TotalFreedom";
then
    echo "ERROR - There is an instance of the server already running. Make sure it is killed first and try again"
else
    screen -dmS TotalFreedom java -Xms18G -Xmx18G -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10 -jar paperclip.jar
    echo "Server Started"
fi
