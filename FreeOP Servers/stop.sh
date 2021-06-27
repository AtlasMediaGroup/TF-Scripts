#!

#Pull in the .env file for variables.
source .env.sh

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
    else
        echo "Server has been shut down succesfully."
    fi
else
    echo "$SARCASTIC_MESSAGE"
fi
