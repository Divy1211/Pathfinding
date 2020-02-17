# Pathfinding
1. I have coded the A* pathfinding algorithm in Processing (a java animations library), my code is a bit messy but i think it will be readable enough. You can run the code in the Processing Developement Environment (PDE) itself.  
2. If you find a bug you can open a pull request.

# Prerequisites
1. You should have Java installed.
2. You should also download and install the [Processing Developement Environment](https://processing.org/)

# How the program works

1. You can learn about the algorithm by watching [this youtube video](https://www.youtube.com/watch?v=-L-WgKMFuhE) if you do not know what it is. I have offered a simple explanation of it here if you do not wish to watch the entire video but I recommend you watch it for a good understanding as my explanation will be no where near as good as the video!

2. A simple explanation is that the goal of the algorithm is to find the shortest path between two given nodes on a graph.

3. This is done by first picking two nodes, 'A' and 'B' which are our starting and ending points respectively.

4. Now pick 'A' (the starting point) as our 'current' node and asign three values to each neighbouring node of A. The first one of these values is the G-cost. This is the distance of any node from the starting node 'A'. The second is the H-cost which is the distance of any node from the ending node 'B'. The third is the F-cost which is the sum of the G and H costs.

5. The current node is added to a list of 'closedCells'. 

6. The values of the G,H and F costs are calculated for all neighbour nodes of the current node which are not blocked.

7. All of the above neighbours are added to a list of 'openCells' and the current cell is removed from 'openCells'.

8. Every node has a 'parent' node, which is the node it is the neighbour of. To explain this further, consider an example, with 4 nodes A,B,C and D where B,C and D are all neighbours of A. thus, the 'parent' node of B,C and D cells is the 'A' node

9. Now pick the node with the least F-cost and make it our new 'current' node from the list of 'openCells'. If two or more nodes have the same F-cost, we pick the one with the lowest H-cost, if that is also the same, we pick any one of them at random.

10. Now repeat steps 5 and 9 till 'current' node becomes the target node 'B'.

11. To determine the path, the chain of 'parent' nodes is traced back from the 'current' node (which is now the target node).

12. In my program, left clicking 'blocks/unblocks' a node (refered to as cell in my program) and right clicking sets the starting node A and right clicking again sets the target node B. after the path is reached, right clicking again will set a new target node B and starting node A will become the old target node.

13. A blocked node is coloured purple, the nodes A and B are coloured in blue and the path is colored in yellow.

14. Here is the demonstration:
![](https://github.com/Divy1211/Pathfinding/blob/master/Pathfinding.gif)
