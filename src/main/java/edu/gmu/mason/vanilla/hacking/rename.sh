
for oldname in *.tsv.zip
do
     num=$(echo $oldname | awk -F '[.-]' '{printf "%03d", $2}')
    newname="AgentStateTable-${num}.tsv.zip"
    mv -- "$oldname" "$newname"
done