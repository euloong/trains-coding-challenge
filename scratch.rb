# Graph: AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7

#      A   B   C   D   E
# A    0   5   0   5   7
# B    0   0   4   0   0
# C    0   0   0   8   2
# D    0   0   8   0   6
# E    0   3   0   0   0

adjacency_matrix = [
    [0, 5, 0, 5, 7],
    [0, 0, 4, 0, 0],
    [0, 0, 0, 8, 2],
    [0, 0, 8, 0, 6],
    [0, 3, 0, 0, 0]
]

#The length of the shortest route (in terms of distance to travel) from A to C. Answer: 9
# Initial state:
# Distance start vertex from start vertex = 0
# Distance of all other vertices from start = infinity or a really large number like 100
# Visited vertices = [ ]
# Unvisited vertices = [A, B, C, D, E]

visited_vertices = []
unvisited_vertices = [0, 1, 2, 3, 4]

# WHILE vertices remain unvisited
        #while visited_vertices != unvisited_vertices
        #end

# 	Visit the unvisited vertex with the smallest known distance from the start vertex (the current vertex)
current_node = unvisited_vertices.first
puts "Current node is #{current_node}"

visited_status_of_current_node = visited_vertices.include?(current_node)
puts "Visit status of current node is #{visited_status_of_current_node}"

if (visited_status_of_current_node == false)
    puts "Array of distance to neighbouring nodes from current node: #{adjacency_matrix[current_node]}"
    #find the first smallest number > 0
    #store it's value(distance) and index(node)
    #loop through each value > 0
end

# 	FOR each unvisited neighbour of the current vertex
# 		calculate distance the distance from the start vertex
# 		IF the calculated distance is less than the known distance
# 			Update shortest distance to this vertex
# Update the previous vertex with the current vertex
# end if
# 	NEXT unvisited neighbour
# 	Add the current vertex to the list of visited vertices
# End WHILE