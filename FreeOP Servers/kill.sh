#!
if screen -list | grep -q "TotalFreedom";
then
    screen -X -S "TotalFreedom" stuff "^C^C^C^C^C^C^C^C^C^C^C^C^C"
    sleep 5
else
    echo "The server is not running... Try starting it <3"
fi

if screen -list | grep -q "TotalFreedom";
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

if screen -list | grep -q "TotalFreedom";
then
    echo "Kill Command Failed. Please try again"
else
    echo "Graceful Shutdown Complete! Yay TotalFreedom"
fi
