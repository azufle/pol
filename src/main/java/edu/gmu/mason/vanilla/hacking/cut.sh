# It cuts the tsv file to "Tick, Time, Location, Agent ID." 
# It also removes the header line.
# It can be used just for one folder
# You need to manually concat the `AgentStateTable` in the root folder 

# RENAME FILES TO MAKE THE RIGHT ORDER:
# use rename.sh 

# Usage: bash cut.sh

output_file=data.tsv
echo $output_file
> $output_file
rm *.tsv # remove the old files
for file in AgentStateTable-*.tsv.zip; do
  unzip "$file"

first_file=1
for file in *.tsv; do
if [ $file != $output_file ]; then
  echo cuttting the $file ...
  if [ $first_file -eq 1 ]; then
    cut -f 1-4 "$file" >> $output_file
    first_file=0
  else
    tail -n +2 "$file" | cut -f 1-4 >> $output_file
  fi
  rm $file
  fi
done

done
