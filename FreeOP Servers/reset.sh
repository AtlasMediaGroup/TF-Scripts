#!

#Pull in the .env file for variables.
source .env.sh

TIMESTAMP=`date +%Y-%m-%d_%H-%M-%S`
WORLDS=("adminworld" "flatlands" "masterbuilderworld" "plotworld" "world" "world_nether" "world_the_end")

if test -f "/home/tfserver/.noresets"
then
echo "Resets are not permitted on this server."
exit 1
else
    if [ -z "$1" ]
    then
    echo "Invalid Selection"
    exit 1
    else
        if [ -d "/home/tfserver/archives" ]
        then
            echo "Archives will be stored in /home/tfserver/archives"
        else
            mkdir -p /home/tfserver/archives
        fi

        if [ -d "/home/tfserver/template/$1" ] 
        then  
            if screen -list | grep -q "$SCREEN_NAME"; 
            then      
                source /home/tfserver/stop.sh 
                if screen -list | grep -q "$SCREEN_NAME"; 
                then      
                    source /home/tfserver/stop.sh 
                fi
            fi
            # Write the reset file to disk so we make sure if someone is stupid and tries to now re-start the server, the world doesn't fucking end... 
            touch $RESET_FILE      

            for world in ${WORLDS[@]};
            do
                if [ -d "/home/tfserver/$world" ]
                then
                    tar -zcvf $world-$TIMESTAMP.tar.gz /home/tfserver/$world
                    mv /home/tfserver/$world-$TIMESTAMP.tar.gz /home/tfserver/archives//$world-$TIMESTAMP.tar.gz
                    rm -rf /home/tfserver/$world
                    echo "The world named $world has now been archived"
                fi 
            done
            
            # Archives out the CoreProtect Database for history. 
            if ls /home/tfserver/plugins/CoreProtect-* 1> /dev/null 2>&1;
            then
                mysqldump -h $DB_HOSTNAME $CO_DATABASE --no-tablespaces > $CO_DATABASE-$TIMESTAMP.sql
                mv /home/tfserver/$CO_DATABASE-$TIMESTAMP.sql /home/tfserver/archives/$CO_DATABASE-$TIMESTAMP.sql
                echo "CoreProtect Database downloaded to /home/tfserver/archives/$CO_DATABASE-$TIMESTAMP.sql"
                echo "SET FOREIGN_KEY_CHECKS = 0;" > ./temp.sql
                mysqldump --add-drop-table --no-data --no-tablespaces -h $DB_HOSTNAME $CO_DATABASE | grep 'DROP TABLE' >> ./temp.sql
                echo "SET FOREIGN_KEY_CHECKS = 1;" >> ./temp.sql
                mysql $CO_DATABASE -h $DB_HOSTNAME < ./temp.sql
            fi

            # Archives out the Essentials spawnpoints for history. 
            if ls /home/tfserver/plugins/Essentials-* 1> /dev/null 2>&1;
            then
                mv /home/tfserver/plugins/Essentials/spawn.yml /home/tfserver/archives/Essentials-spawn.yml-$TIMESTAMP.yml
                echo "Essentials Spawn Configuration downloaded to /home/tfserver/archives/$CO_DATABASE-$TIMESTAMP.sql"
            fi

            cp -R /home/tfserver/template/$1 /home/tfserver/world

            # Remove that lock file now that we actually want to start the server up. 
            rm -f $RESET_FILE
            source /home/tfserver/start.sh      
        else
            echo "ERROR - The template: $1  you have attempted to restore, does not exist."
        fi
    fi
fi
