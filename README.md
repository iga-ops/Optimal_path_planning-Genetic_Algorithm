# Optimal_path_planning-Genetic_Algorithm
The use of a genetic algorithm to determine optimal routes for drones, where the obtained route is expected to fulfill the condition of minimizing the energy consumption. 


### The established assumptions:
1. The drones analyzed are unitary, treated as individual drones (the sequence of operations of each drone is performed for different customers).
2. The distribution of routes and destinations is changing, while the location of docking stations is known and fixed.
3. The coordinated travel speeds of all drones, over all specified sections, are established.


### Adopted additional assumptions:
1. The connection between a given start and finish station cannot be direct.
2. If at a given station, at a given time, the limit of drones staying is filled, then another energy-optimal route is chosen for that drone, for which this problem does not occur.
3. There is a limit on the number of drones that can stay at a given station at the same time.
4. Energy consumption is dependent on weather conditions (weather conditions, especially windy conditions, can cause higher energy consumption).

## How the created genetic algorithm works:
1) A population of particles is created based on randomly generated numbers, in a range bounded by the number of docking stations.
2) From the generated particles, elements that are the start or end point of the drone are cut out.
3) Based on the distances achieved for each particle (which at this stage are equivalent to energy consumption), 'parents' are selected.
4) The "children" are created:
- First a piece of parent one is randomly selected, then the gaps are filled with parent two.
- The whole is cut down to a random size, since we need to determine a path not through all points, but through an undefined number of them.
- At the beginning and end of the resulting sequence, the start and end points of the drone are added respectively.
5) The generated paths (children) are returned as a list of potential paths between given points.

## How the created application works:
1) The necessary configuration parameters are defined. 
2) A list of docking stations is downloaded, along with the number of charging spots they have.
3) For each drone a path is determined so that the energy consumption is minimal:
- Through a genetic algorithm, potential paths are generated.
- The cost of each path is calculated considering the weather conditions.
- The paths that do not have a set minimum number of points between the start and end points are eliminated.
- It is checked if at least one charging location is available at the destination docking station in the next steps.
- The path with the lowest energy consumption that satisfies the set constraints is returned.
4) The received data is collected accordingly.
5) The generation of graphs showing the result is performed.

## An example of a obtained graph.
![My Image](C:\Users/igach/Downloads/result_example.PNG)
