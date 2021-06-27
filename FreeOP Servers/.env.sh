#!

# These ones should be server specific
JVM_HEAP="18G"
PAPER_JAR_NAME="paperclip.jar"

# DO NOT Change these ones
SCREEN_NAME="TotalFreedom"
SARCASTIC_MESSAGE="The server is not running... Why don't you try starting it? <3"
RESET_FILE=/home/tfserver/.resetting
JVM_LAUNCH_OPTS="-XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10"

#Java 16 Launch Opts
#JVM_LAUNCH_OPTS="-illegal-access=permit -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10"