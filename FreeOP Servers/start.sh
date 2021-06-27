#!

#Pull in the .env file for variables.
source .env.sh

if test -f "$RESET_FILE"; 
then
    echo "CRITICAL ERORR - Server is currently re-setting. Please wait for this action to complete."
else
    if screen -list | grep -q "$SCREEN_NAME";
    then
        echo "ERROR - There is an instance of the server already running. Make sure it is killed first and try again"
    else
        screen -dmS $SCREEN_NAME java -Xms$JVM_HEAP -Xmx$JVM_HEAP -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10 -jar $PAPER_JAR_NAME
        echo "Server Started"
    fi
fi


