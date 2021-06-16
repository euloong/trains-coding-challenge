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

#Find the length of the shortest route (in terms of distance to travel) from A to C. Answer: 9
#initial state
@infinity = 100
visited_vertices = []
unvisited_vertices = ['A', 'B', 'C', 'D', 'E']
known_distance_from_A = [0, @infinity, @infinity, @infinity, @infinity]
puts "Initial state is: #{known_distance_from_A}"

start_node_value = unvisited_vertices.first
puts "The start node is: #{start_node_value}"
start_node_index = unvisited_vertices.index(start_node_value)
# WHILE vertices remain unvisited
    #while unvisited_vertices.size > 0
# 	Visit the unvisited vertex with the smallest known distance from the start vertex (the current vertex). This is A-A = 0
visited_status_of_start_node = visited_vertices.include?(start_node_index)
puts "Visit status of start node is #{visited_status_of_start_node}"

if (visited_status_of_start_node == false)
    calculated_distance_from_A = adjacency_matrix[start_node_index]
    puts "Calculated distances of neighbouring nodes from start node: #{calculated_distance_from_A}"
# 	FOR each unvisited neighbour of the current vertex
# 		calculate the distance from the start vertex
# 		IF the calculated distance is less than the known distance
# 			Update shortest distance to this vertex
    calculated_distance_from_A.each_with_index do |calculated_distance, index|
        if calculated_distance < known_distance_from_A[index]
            known_distance_from_A[index] = calculated_distance
            if calculated_distance_from_A[index] < known_distance_from_A[index]
                known_distance_from_A[index] = calculated_distance_from_A[index] + known_distance_from_A[index]
            end
        end
    end
    puts "New state is: #{known_distance_from_A}"
end
# Update the previous vertex with the current vertex
#question: how do I log the previous vertex? do I want to?
# end if
# 	NEXT unvisited neighbour
# 	Add the current vertex to the list of visited vertices
visited_vertices << start_node_value
#To do: need to overwrite the unvisted vertice matrix otherwise infinite loop
new_unvisited_vertices = unvisited_vertices.drop(1)
puts "visited vertices: #{visited_vertices}"
puts "new unvisited vertices: #{new_unvisited_vertices}"
new_start_node = new_unvisited_vertices.first
puts "new start node: #{new_start_node}"
start_node_index = new_unvisited_vertices.index(new_start_node)
puts "start node index(should be 0): #{start_node_index}"
# End WHILE
#end
