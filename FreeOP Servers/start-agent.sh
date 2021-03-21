#!
if screen -list | grep -q "jAgent";
then
    echo "ERROR - There is already an instance of the agent running."
else
    screen -dmS jAgent java -Xms2G -Xmx2G -jar jagent-1.0.jar
    echo "Agent Started"
fi
