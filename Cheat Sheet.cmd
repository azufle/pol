head -n 10 filename
sed -n '1,10p' filename

# data preparation 

grep -n 2019-07-14T23:55:00.000 data.tsv
head -n 38927105 data.tsv > warmup.tsv

grep -n 2019-07-28T23:55:00.000 data.tsv
sed -n '38927106,77255297p' data.tsv > normal.tsv


sed -n '77255298, $p' data.tsv > needle.tsv
head data.tsv && tail data.tsv

# french

2019-07-31T00:00:00.000

cut -f 1-4 full.data.tsv > data.tsv

grep -n 2019-07-30T23:55:00.000 data.tsv
head -n 82730753 data.tsv > warmup.tsv

grep -n 2019-08-14T23:55:00.000 data.tsv
sed -n '82730754,123796673p' data.tsv > train.tsv

sed -n '123796674, $p' data.tsv > test.tsv
head data.tsv && tail data.tsv


# ayear:
grep -n 2020-06-30T23:55:00.000 data.tsv

sed -n '8640002,105408001p' data.tsv > normal.tsv
sed -n '105408002, $p' data.tsv > test.tsv
# info.txt:

pwd > info.txt
date >> info.txt
echo $ head data.tsv >> info.txt
head data.tsv >> info.txt
echo $ tail data.tsv >> info.txt
tail data.tsv >> info.txt
echo ----------------------------------- >> info.txt
echo $ head warmup.tsv >> info.txt
head warmup.tsv >> info.txt
echo $ tail warmup.tsv >> info.txt
tail warmup.tsv >> info.txt
echo ----------------------------------- >> info.txt
echo $ head train.tsv >> info.txt
head train.tsv >> info.txt
echo $ tail train.tsv >> info.txt
tail train.tsv >> info.txt
echo ----------------------------------- >> info.txt
echo $ head test.tsv >> info.txt
head test.tsv >> info.txt
echo $ tail test.tsv >> info.txt
tail test.tsv >> info.txt

zip  test.tsv.zip test.tsv
zip  train.tsv.zip train.tsv


#Check files:
diff normal.tsv /home/research/c2/pol/examples/logs/logs/2023-05-27/normal.tsv
diff normal.tsv /home/research/c3/pol/examples/logs/logs/2023-05-27/normal.tsv
diff normal.tsv /home/research/c4/pol/examples/logs/logs/2023-05-27/normal.tsv
diff normal.tsv /home/research/c5/pol/examples/logs/logs/2023-05-27/normal.tsv
diff normal.tsv /home/research/c6/pol/examples/logs/logs/2023-05-27/normal.tsv


#Copy to Drive:
rclone copy info.txt googledrive:"/Andreas/Data Preparation/dataset.v4"
rclone copy normal.tsv googledrive:"/Andreas/Data Preparation/dataset.v2"
rclone copy needle.tsv googledrive:"/Andreas/Data Preparation/dataset.v2"


rclone copy normal.tsv googledrive:/Andreas/Data/Jun-02-2023/c6
rclone copy needle.tsv googledrive:/Andreas/Data/Jun-02-2023/c6
rclone copy info.txt googledrive:/Andreas/Data/Jun-02-2023/c6

# Full data analysis 
rm -f agent00.full.data.tsv
rm -f agent01.full.data.tsv
rm -f agent02.full.data.tsv
ls
Rscript /home/script/tsv_to_sql.r full.data.tsv
rclone copy full.data.db googledrive:/Andreas/Data/30-05-2023/c2

# agent specific analysis 
# agent.full.data to db
dir=c6
head -n 1 full.data.tsv > agent00.full.data.tsv
head -n 1 full.data.tsv > agent01.full.data.tsv
head -n 1 full.data.tsv > agent02.full.data.tsv

awk '$6 == "0"  {print}' full.data.tsv >> agent00.full.data.tsv
awk '$6 == "1"  {print}' full.data.tsv >> agent01.full.data.tsv
awk '$6 == "2"  {print}' full.data.tsv >> agent02.full.data.tsv

rclone copy agent00.full.data.tsv googledrive:/Andreas/Data/30-05-2023/$dir
rclone copy agent01.full.data.tsv googledrive:/Andreas/Data/30-05-2023/$dir
rclone copy agent02.full.data.tsv googledrive:/Andreas/Data/30-05-2023/$dir

rm -f  agent00.full.data.tsv.db
rm -f  agent01.full.data.tsv.db
rm -f  agent02.full.data.tsv.db
Rscript /home/script/tsv_to_sql.r agent00.full.data.tsv
Rscript /home/script/tsv_to_sql.r agent01.full.data.tsv
Rscript /home/script/tsv_to_sql.r agent02.full.data.tsv

rclone copy agent00.full.data.tsv.db googledrive:/Andreas/Data/30-05-2023/$dir
rclone copy agent01.full.data.tsv.db googledrive:/Andreas/Data/30-05-2023/$dir
rclone copy agent02.full.data.tsv.db googledrive:/Andreas/Data/30-05-2023/$dir


rclone copy result.tsv googledrive:/Andreas/Data/Queries/c6
rclone copy result.tsv  googledrive:/Andreas/Data/Queries

 sh   run_san_francisco.sh  | tee -a output.txt
 sh run_san_francisco.sh > >(tee -a output.txt) 2> >(tee -a error.txt >&2)


rclone copy outputc1000.txt googledrive:/Andreas/TEMP/

rclone copy  apartment.points googledrive:"/Andreas/Data Preparation/dataset.v3"
rclone copy  restaurant.points googledrive:"/Andreas/Data Preparation/dataset.v2"
rclone copy  recreation.points googledrive:"/Andreas/Data Preparation/dataset.v2"
rclone copy  workplace.points googledrive:"/Andreas/Data Preparation/dataset.v2"
rclone copy Checkin.tsv  googledrive:"/Andreas/Data Preparation/dataset.v2"
cd 
screen 

docker exec -it hamiri bash

dir=c10000
cd /home/pol2/$dir
git clone git@github.com:haenter/pol.git
cd pol
mvn install:install-file -Dfile=src/main/resources/libs/jts-1.13.1.jar -DgroupId=com.vividsolutions -DartifactId=jts -Dversion=1.13.1 -Dpackaging=jar
mvn install:install-file -Dfile=src/main/resources/libs/geomason-1.5.2.jar -DgroupId=sim.util.geo -DartifactId=geomason -Dversion=1.5.2 -Dpackaging=jar
mvn install:install-file -Dfile=src/main/resources/libs/mason-19.jar -DgroupId=sim -DartifactId=mason -Dversion=19 -Dpackaging=jar
mvn install:install-file -Dfile=src/main/resources/libs/mason-tools-1.0.jar -DgroupId=at.granul -DartifactId=mason-tools -Dversion=1.0 -Dpackaging=jar
mvn clean install

cd examples
cat san_francisco.properties
cat run_san_francisco.sh
sh run_san_francisco.sh > >(tee -a output_$dir.txt) 2> >(tee -a error_$dir.txt >&2)
rclone copy output_$dir.txt googledrive:/Andreas/TEMP/Constant
rclone copy error_$dir.txt googledrive:/Andreas/TEMP/Constant


sh run_french_quarter.sh > >(tee -a output_french.txt) 2> >(tee -a error_french.txt >&2)



sh run_san_francisco.sh > >(tee -a output_sanfranc.txt) 2> >(tee -a error_sanfranc.txt >&2)


cd /home/datapaper/15months/5k

cd /home/datapaper/15months/5k/atl/pol/examples
cd /home/datapaper/15months/5k/gmu/pol/examples
cd /home/datapaper/15months/5k/nola/pol/examples
cd /home/datapaper/15months/5k/sfco/pol/examples

# PREPARING THE DATASET PAPER:

dir=SFCO-1K-15
cat pattenrs_of_life.log

grep -n -m 1 2020-09-23T00:00:00 Checkin.tsv  

head -n 2507221 Checkin.tsv  > CheckIns.tsv &&
zip CheckIns.tsv.zip CheckIns.tsv &&
rclone copy CheckIns.tsv.zip googledrive:/Andreas/DataPaper/$dir/&

grep -n -m 1 2020-09-23T00:00:00 SocialNetwork.tsv 

head -n 8663639 SocialNetwork.tsv  > SocialLinks.tsv&&
zip  SocialLinks.tsv.zip SocialLinks.tsv  &&
rclone copy SocialLinks.tsv.zip googledrive:/Andreas/DataPaper/$dir/&
ls -lh

sh /home/script/check-filename.sh
sh /home/script/rename.sh
sh /home/script/fulldata.sh

cut -f 2-4 full.data.tsv > data.tsv

grep -n 2020-09-22T23:55:00.000 data.tsv

head -n 129600001 data.tsv > traj.tsv &&
zip traj.tsv.zip traj.tsv &&
rclone copy traj.tsv.zip googledrive:/Andreas/DataPaper/$dir/&

scp Checkin.tsv   hamiri@hopper.mathcs.emory.edu:/local/scratch/hamiri/.


