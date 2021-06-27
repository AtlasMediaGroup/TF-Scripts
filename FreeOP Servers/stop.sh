#!

#Pull in the .env file for variables.
source .env.sh

if test -f "$RESET_FILE"; 
then
    echo "CRITICAL ERORR - Server is currently re-setting. Please wait for this action to complete."
    exit 1
else
    if screen -list | grep -q "$SCREEN_NAME"; then
        screen -X -S "$SCREEN_NAME" stuff "stop^M"
        sleep 5
        if screen -list | grep -q "$SCREEN_NAME"; then
            screen -X -S "$SCREEN_NAME" stuff "^C"
            sleep 5
        fi

        if screen -list | grep -q "$SCREEN_NAME"; then
            screen -X -S "$SCREEN_NAME" stuff "^C^C^C^C^C^C^C^C"
        fi

        if screen -list | grep -q "$SCREEN_NAME"; then
            echo "Graceful Shutdown Failed. Please run tf!kill"
            exit 1
        else
            echo "Server has been shut down succesfully."
            exit 0
        fi
    else
        echo "$SARCASTIC_MESSAGE"
        exit 0
    fi
fi