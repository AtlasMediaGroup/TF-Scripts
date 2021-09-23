#!

# These ones should be server specific
JVM_HEAP="6G"
PAPER_JAR_NAME="paperclip.jar"

# More Server specific ones - This time for CoreProtect
DB_HOSTNAME="db04.core.atlas-media.co.uk"
CO_DATABASE="DEV_TotalFreedom-Freedom2-CoreProtect"
#Follow https://stackoverflow.com/questions/9293042/how-to-perform-a-mysqldump-without-a-password-prompt for Username & Password

# DO NOT Change these ones
SCREEN_NAME="TotalFreedom"
SARCASTIC_MESSAGE="The server is not running... Why don't you try starting it? <3"
RESET_FILE="/home/tfserver/.resetting"
#JVM_LAUNCH_OPTS="-XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10"

#Java 16 Launch Opts
#JVM_LAUNCH_OPTS="--illegal-access=permit -XX:+UseZGC -XX:+DisableExplicitGC"

#Java 17 Launch Opts
#JVM_LAUNCH_OPTS="-XX:+UseZGC -XX:+DisableExplicitGC"

#Java 17 Launch Opts - Temporary due to Paper bug and OpenVZ Issues
JVM_LAUNCH_OPTS="-XX:+DisableExplicitGC -DPaper.IgnoreJavaVersion=true"
