# APCSFinalProject: Unnamed F1 Simulation
## By: Jordan Maragakis and Renggeng Zheng
Doc: https://docs.google.com/document/d/178_OMngXy3z04lZC-P3XWcUrQYE7QrIQQOCVvnEeydw/edit?usp=sharing

The project will be a simulation of a car’s efficacy on a given F1 track, assuming perfect drivers are behind the wheel. The simulation will consider track grip (the static and non-static friction coefficients), the track’s effects on tire wear, car acceleration, car top speed, car down force, and car tire compound in these calculations. Simulations can be run with cars with preset statistics to see which cars in the current F1 season will likely win on a given track.

## Instructions for Compiling and Running
Requires Processing version 3: https://processing.org/download/

## Dev Log (YYYY-MM-DD|Initials)
2021-05-22|RZ - Created get methods and instance variables for the Car, Track, TrackCamera class. Created untested class for conversion between Cartesian and polar coordinates.
2021-05-22|JM - Planned the interaction between classes and created the Car and Physics classes. Added instance vars and get methods to various classes.

2021-05-23|RZ - Prototype/development plan created. Documentation framework begun as well as the UML.
2021-05-23|JM - Worked with Reng on Prototype and UML. Also added to the Physics class and debugged some of the Polar and Cartesian math class.

2021-05-24|RZ - Resolved some repetitive code from initial development. Implemented a rotate function that is used to display a PImage of the car facing the direction of movement.
2021-05-24|JM - finished basic omnidirectional movement with the Car and Physics classes. Also fixed the cartesian to polar conversion method that had been causing some problems.
