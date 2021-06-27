#!

declare -a dirs
i=1
for d in /home/tfserver/template/*/
do
    d=${d#"/home/tfserver/template/"}
    dirs[i++]="${d%/}"
done
echo "There are ${#dirs[@]} templates to chose from"
for((i=1;i<=${#dirs[@]};i++))
do
    echo $i")" "${dirs[i]}"
done

