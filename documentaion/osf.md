The names of the folders are formatted as follows: 'map-numberOfAgents-simulationTime'. This means that each folder's name reflects the map used, the number of agents involved, and the duration of the simulation.

map:
- ATL: Atlanta
- GMU: George Mason University
- NOLA: New Orleans
- SFCO: San Francisco

numberOfAgents:
- 1K: 1000 agents
- 3K: 3000 agents
- 5K: 5000 agents
- 10K: 10,000 agents

simulationTime: 
- 15mo: ~15 months = 15*30 days = 15*30*288 steps
- 121mo: ~121months = 121*30 days = 121*30*288 steps
- 241mo: ~241 months = 241*30 days = 241*30*288 steps

Each folder includes the following files:
1. CheckIns.tsv.zip: This file documents the locations visited by the agents.
2. info.txt: This file contains the first 10 and last 10 rows of the traj.tsv dataset.
3. SocialLinks.tsv.zip: This file records the social connections established by the agents.
4. traj.tsv.zip*: This is the trajectory dataset.

NOTE: To comply with OSF requirements, the traj.tsv.zip file may be split into several parts. We used the 'split' command in Linux for this purpose. To reassemble these parts, you should be able to use the 'cat' command, ensuring that the parts are concatenated in the correct order.
