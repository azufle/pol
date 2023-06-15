# Hossein Amiri | May 23, 2023

# Step 1 (Run the simulation):

1. Fork the repository to your github ( there is a button in github to fork)
2. Clone the repository to your local machine and go to the `pol` directory. For me it was: `git clone git@github.com:haenter/pol.git` then `cd pol`

- - **NOTE:** the path to the `pol` folder should not contain `space` or maybe other special characters. (I got Exception that file does not exist on a Linux Machine)

3. Install maven local dependencies as indicated in `pom.xml` file

   - `mvn install:install-file -Dfile=src/main/resources/libs/jts-1.13.1.jar -DgroupId=com.vividsolutions -DartifactId=jts -Dversion=1.13.1 -Dpackaging=jar`

   - `mvn install:install-file -Dfile=src/main/resources/libs/geomason-1.5.2.jar -DgroupId=sim.util.geo -DartifactId=geomason -Dversion=1.5.2 -Dpackaging=jar`

   - `mvn install:install-file -Dfile=src/main/resources/libs/mason-19.jar -DgroupId=sim -DartifactId=mason -Dversion=19 -Dpackaging=jar`

   - `mvn install:install-file -Dfile=src/main/resources/libs/mason-tools-1.0.jar -DgroupId=at.granul -DartifactId=mason-tools -Dversion=1.0 -Dpackaging=jar`

4. Build the project using maven: `mvn clean install`
5. From github: `There are two ways to run a simulation: (1) GUI and (2) headless. For the GUI version, run the main method in src/main/java/edu/gmu/mason/vanilla/WorldModelUI.java. For the headless version, invoke the main method in src/main/java/edu/gmu/mason/vanilla/WorldModel.java with appropriate arguments. `
6. I use bash file to run the project loacated in examples e.g. `run.sh`
7. YOU HAVE DONE THE FIRST STEP! You should see the simulations in progress with the default configurations.

# Step 2 (Data Preparation)

1. I use hacking/cut.sh to integrate the data and cut only "Tick, Time, Location, Agent ID."
2. I separate data to three sets: 2 weeks warmup, 2 weeks normal run, 2 weeks abnormal (needle)
3. I use `head`, `tail` and `sed` linux command to prepare the data I can use only sed to cut a piece of the data.
4. I commit different configuration c1, c2, c3, etc. for the manipulation

- - c1: red:0, yellow:0.5, and green:0.75 needle as `multiplication` factors for keepingFullTimeInMinutes -> 30 agents in total **different** from agents in c2
- - c2: red:3, yellow:2, and green:1.5 needle as `multiplication` factors for fullnessDecreasePerStep -> 30 agents in total **different** from agents in c1
- - c3: red:0, yellow:0.5, and green:0.75 needle as `multiplication` factors for keepingFullTimeInMinutes -> 30 agents in total the **same** agents as in c4
- - c4: red:3, yellow:2, and green:1.5 needle as `multiplication` factors for fullnessDecreasePerStep -> 30 agents in total the **same** agents as in c3
- - c5: c3+c4 combine c3 and c4 for each agent -> 30 agents in total agents are the same as in c3 and c4
- - c6:c1+c2+c5 combine c1, c2, c5 for different agents -> 90 agents in total
