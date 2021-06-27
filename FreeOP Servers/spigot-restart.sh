#!

#Pull in the .env file for variables.
source .env.sh

sleep 10
if screen -list | grep -q "$SCREEN_NAME";
then
    screen -X -S "$SCREEN_NAME" stuff "stop^M"
    sleep 5
fi

if screen -list | grep -q "$SCREEN_NAME";
then
    screen -X -S "$SCREEN_NAME" stuff "^C"
    sleep 5
fi

if screen -list | grep -q "$SCREEN_NAME";
then
    screen -X -S "$SCREEN_NAME" stuff "^C^C^C^C^C^C^C^C"
fi

if screen -list | grep -q "$SCREEN_NAME";
then
    echo "Graceful Shutdown Failed. Please run tf!kill"
fi

if screen -list | grep -q "$SCREEN_NAME";
then
    echo "ERROR - We have been unable to re-start the server... Please execute this manually"
else
    screen -dmS $SCREEN_NAME java -Xms$JVM_HEAP -Xmx$JVM_HEAP -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10 -jar $PAPER_JAR_NAME
    echo "Server Started"
fi
