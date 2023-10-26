# Hossein Amiri | June 26, 2023

# Step 1 (Run the simulation):

1. Fork the repository to your GitHub ( there is a button in GitHub to fork)
2. Clone the repository to your local machine and go to the `pol` directory. For me, it was: `git clone git@github.com:haenter/pol.git` then `cd pol`

- - **NOTE:** The path to the `pol` folder should not contain `space` or maybe other special characters. (I got an Exception that the file does not exist on a Linux Machine)

3. Install maven local dependencies as indicated in `pom.xml` file

   - `mvn install:install-file -Dfile=src/main/resources/libs/jts-1.13.1.jar -DgroupId=com.vividsolutions -DartifactId=jts -Dversion=1.13.1 -Dpackaging=jar`

   - `mvn install:install-file -Dfile=src/main/resources/libs/geomason-1.5.2.jar -DgroupId=sim.util.geo -DartifactId=geomason -Dversion=1.5.2 -Dpackaging=jar`

   - `mvn install:install-file -Dfile=src/main/resources/libs/mason-19.jar -DgroupId=sim -DartifactId=mason -Dversion=19 -Dpackaging=jar`

   - `mvn install:install-file -Dfile=src/main/resources/libs/mason-tools-1.0.jar -DgroupId=at.granul -DartifactId=mason-tools -Dversion=1.0 -Dpackaging=jar`

4. Build the project using maven: `mvn clean install`
5. From the original Github repo: `There are two ways to run a simulation: (1) GUI and (2) headless. For the GUI version, run the main method in src/main/java/edu/gmu/mason/vanilla/WorldModelUI.java. For the headless version, invoke the main method in src/main/java/edu/gmu/mason/vanilla/WorldModel.java with appropriate arguments. `
6. I use a bash file to run the project located in examples e.g. `run.sh`
7. YOU HAVE DONE THE FIRST STEP! You should see the simulations in progress with the default configurations.

# Step 2 (Data Preparation)

1. Run the simulation you want. If you need a new map, refer to `documentation/map.md`
1. After the simulation is done, your /examples/logs/logs folder contains `AgentStateTable.tsv` 
1. If the generated data is larger than the threshold, the simulation will compress 512MB chunks to zip files. So, you need to combine them.
1. You can use `fulldata.sh` to combine files in the same folder and then use `cut` && `cat` to combine the output manually.
1. Alternatively, you can use hacking/cut.sh to integrate the data and cut only "Tick, Time, Location, Agent ID." 
1. I use the `head`, `tail`, and `sed` Linux commands to prepare the data. You can use only `sed` to cut a piece of the data.
1. Much of the testing is done manually, and scripts facilitate the process. 
1. I use the `split -b 5GB` command to split the data into `5GB` chunks; you can use `cat` to reverse the split and combine the downloaded OSF files. 

***data_wrangling*** contains more convenient scripts for data wrangling
