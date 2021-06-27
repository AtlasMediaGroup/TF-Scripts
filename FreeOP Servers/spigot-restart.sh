#!

#Pull in the .env file for variables.
source .env.sh

if test -f "$RESET_FILE"; 
then
    echo "CRITICAL ERORR - Server is currently re-setting. Please wait for this action to complete."
    exit 1
else
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
        exit 1
    fi

    if screen -list | grep -q "$SCREEN_NAME";
    then
        echo "ERROR - We have been unable to re-start the server... Please execute this manually"
        exit 1
    else
        screen -dmS $SCREEN_NAME java -Xms$JVM_HEAP -Xmx$JVM_HEAP $JVM_LAUNCH_OPTS -jar $PAPER_JAR_NAME
        echo "Server Started"
        exit 0
    fi
fi