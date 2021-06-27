#!

#Pull in the .env file for variables.
source .env.sh

if screen -list | grep -q "$SCREEN_NAME";
then
    screen -X -S "$SCREEN_NAME" stuff "^C^C^C^C^C^C^C^C^C^C^C^C^C"
    sleep 5
else
    echo "$SARCASTIC_MESSAGE"
fi

if screen -list | grep -q "$SCREEN_NAME";
then
    fuser -k 25565/tcp
    rm -f /home/tfserver/world/session.lock
    rm -f /home/tfserver/flatlands/session.lock
    rm -f /home/tfserver/hubworld/session.lock
    rm -f /home/tfserver/masterbuilderworld/session.lock
    rm -f /home/tfserver/plotworld/sesssion.lock
    rm -f /home/tfserver/world_nether/session.lock
    rm -f /home/tfserver/world_the_end/session.lock
    sleep 5
fi

if screen -list | grep -q "$SCREEN_NAME";
then
    echo "Kill Command Failed. Please try again"
else
    echo "Graceful Shutdown Complete! Yay TotalFreedom"
fi
