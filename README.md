# APCSFinalProject: Unnamed F1 Simulation
## By: Jordan Maragakis and Renggeng Zheng
Doc: https://docs.google.com/document/d/178_OMngXy3z04lZC-P3XWcUrQYE7QrIQQOCVvnEeydw/edit?usp=sharing

The project will be a simulation of a car’s efficacy on a given F1 track, assuming perfect drivers are behind the wheel. The simulation will consider track grip (the static and non-static friction coefficients), the track’s effects on tire wear, car acceleration, car top speed, car down force, and car tire compound in these calculations. Simulations can be run with cars with preset statistics to see which cars in the current F1 season will likely win on a given track.

## Instructions for Compiling and Running
Requires Processing version 3: https://processing.org/download/

1. Download the contents of the git repo.
2. Open F1RacingSim.pde in Processing 3. Do not move any of the files or subfolders of F1RacingSim.
3. Once open in Processing 3, do not touch any of the code. Simply press ctrl + R to run.
4. Set the variables you want your car to have. There are some bounds, some variables do not play nice. Like a real F1 car, if you get your variables wrong, stuff will break. WARNING: Because the AI is randomly generated, there are some scenarios where the AI will go off the track or otherwise break. This is a known issue, and it is because of the aforementioned variable interactions.
5. Press 'd' to enable the debug modes. There's 3, they always display the AI visual lines and the track stats, but cycle between the car's Driver, stats, and Tire.
6. Press 1-4 to switch to the car at that position in the array -1. It zooms in and slows down the simulation so you can see the details of the car driving. If you have issues seeing the debug screen, pressing a button will enlarge it and put it in the top right corner of your screen.

Tada! The simulation should be working.

## Dev Log (YYYY-MM-DD|Initials)
2021-05-22|RZ - Created get methods and instance variables for the Car, Track, TrackCamera class. Created untested class for conversion between Cartesian and polar coordinates.\
2021-05-22|JM - Planned the interaction between classes and created the Car and Physics classes. Added instance vars and get methods to various classes.

2021-05-23|RZ - Prototype/development plan created. Documentation framework begun as well as the UML.\
2021-05-23|JM - Worked with Reng on Prototype and UML. Also added to the Physics class and debugged some of the Polar and Cartesian math class.

2021-05-24|RZ - Resolved some repetitive code from initial development. Implemented a rotate function that is used to display a PImage of the car facing the direction of movement.\
2021-05-24|JM - finished basic omnidirectional movement with the Car and Physics classes. Also fixed the cartesian to polar conversion method that had been causing some problems.

2021-05-24|RZ - Screen edge collision implemented. Added unrealistic friction physics (realism to be implemented, is a proof of concept).\
2021-05-24|JM - Started work on Physics for drifting accurately as well as properly implementing and debugging the old physics-based movement code.

2021-05-25|RZ - Implemented track image importing. Found some bugs in the movement code like the car disappearing when both vectors had magnitudes of 0.\
2021-05-25|JM - Finished the drifting method, did some general debugging, and implemented the driffing into the general driving code.

2021-05-26|RZ - Merged code between Jordan and I. Began the beginnings of the edge detection algorithm of the track by using kernel processing to find the track edge.\
2021-05-26|JM - Helped resolve merge. Also started research into F1 car properties to prepare for 4 wheel and rigid body physics as well as angular momentum.

2021-05-28|RZ - Isolated issue of car drift to the PImage rotation algorithm. Currently isolating portion of PImage rotation algorithm that is affecting xCor and yCor of Car despite it being private.\
2021-05-28|JM - Figured out that rotation was causing a problem with the car displaying, started writing a new rotation algorithm.

2021-05-29|RZ - Scrapped PImage rotation algorithm due to unidentifiable complications. Took Mr. K's suggestion of using rotate(), translate(), and push and popMatrix() to do rotations instead. Implemented and code merged.

2021-05-29|RZ - Changed constructors to use constructors with more parameter options to streamline potential changes. Have a working AI with cheats, working on removing cheats and still having the AI follow the track.\
2021-05-29|JM - Worked out rotation for a rectangle that aligned with the actual car movements, started work on four wheel physics and the necessary rigid body physics.

2021-05-31|RZ - Changed algorithmic edge detection to a manual one because it was easier for the pathfinding to handle compared to the spotty edge detection (manual is using the paintbucket tool in photoshop to make the track and not track parts distinct solid colored blocks). Reworked AI to handle tight corners better so that it can now complete indefinite amounts of laps without error. Added multiple simultaneous drivers.\
2021-05-31|JM - Made a watermark-free version of manaco (a bit out of line, will be fixed later).

2021-06-01|RZ - Implemented a TrackCamera that follows the car around as it moves. It uses button inputs and scales up the entire screen to make it more focused on the car.\
2021-06-01|JM - Did some research into F1 stats on Manaco and finalized most of the new physics engine on paper.

2021-06-02|RZ - Added another track called Zandvoort and made adding new tracks easier. Cleaned up some code and the file directories for neatness.\
2021-06-02|JM - did some testing for the new track and the physics so far. Also did pixel measurements for the tracks and cars to try to create a unified scale (not done in the demo, but to be implemented later).

2021-06-03|RZ - Resolved the 4 modifiable vars issue. Implemented a max turn angle variable called handling (AI cannot deal with angles less than 180 degrees yet), a simplified downforce coefficient variable, and a max acceleration variable (to be implemented).\
2021-06-03|JM - Finished the two point rigid body physics with front wheel turning and accurate car turning. Imtegrated into AIDrover and resolved the many merge issues.

2021-06-06|RZ - Implemented Baku track (from Azerbaijan). Inspired by the Baku 2021 race which ended with 2 tire failures and a red flag, which caused Lewis Hamilton to activate Mercedes' tire "magic" and drive off track, a large upset in the race.

2021-06-08|JM - stopped the cars from driving over eachother and updated the devlog with all changes since demo. (those were done on the demo branch, but not in main).

2021-06-09|RZ - Implemented tire class instantiation in order to simulate tire wear.\
2021-06-09|JM - make the cars change their apparent size based on the camera. smoothed out the passing code

2021-06-10|RZ - Integrated tire code completely and implenented pit crews to complement them. Introduced a driver aggressiveness rating that would affect overtake rates. Merged code, everything works as far as 30 minutes of testing each says.\
2021-06-10|JM - Made the User Interface and the user car. Did final debugging, modifications to AI, resolved merge conflicts, worked on the UML and explenations.
