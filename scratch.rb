#Ruby v2.6.3
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
visited_nodes = []
unvisited_nodes = ['A', 'B', 'C', 'D', 'E']
shortest_distance_from_A = [0, @infinity, @infinity, @infinity, @infinity]
known_distance_from_A = adjacency_matrix[0]

#Setup array of arrays to track closest neighbours to A
nodes = ['A', 'B', 'C', 'D', 'E']
hash = Hash[(0..known_distance_from_A.size-1).zip known_distance_from_A]
puts "hash: #{hash}"
sorted_hash = hash.sort_by {|key, value| value}
puts "sorted hash: #{sorted_hash}"
immediate_neighbours_to_A_array = sorted_hash.delete_if { |k, v| (v == 0) }
puts "array of A's immediate neighbours: #{immediate_neighbours_to_A_array}"
puts "-------------------------------------------------------"
#Start at A, which is index 0 in the adjacency_matrix
start_node_index = 0
#A is 0 from A
distance_of_node_from_A = 0
puts "Distance of node from A: #{distance_of_node_from_A}"

start_node_value = unvisited_nodes.first
puts "Start node is: #{start_node_value}"
puts "-------------------------------------------------------"
while unvisited_nodes.size > 0
    visited_status_of_start_node = visited_nodes.include?(start_node_index)
    if (immediate_neighbours_to_A_array.size > 0)
        known_distances_from_start_node = adjacency_matrix[start_node_index]
        puts "Known distances from start node: #{known_distances_from_start_node}"
        calculated_distances_from_A = known_distances_from_start_node.each_with_index do |distance, index|
            if  (distance > 0)
                known_distances_from_start_node[index] = distance + distance_of_node_from_A
            end
        end
        puts "Calculated distances from A: #{calculated_distances_from_A}"
        calculated_distances_from_A.each_with_index do |calculated_distance, index|
            puts "calc dist:#{calculated_distance}"
            if ((calculated_distance < shortest_distance_from_A[index])  && calculated_distance > 0)
                shortest_distance_from_A[index] = calculated_distance
            puts "Temporary shortest dist from A #{shortest_distance_from_A}"
            end
        end
        puts "Shortest distance from A is now: #{shortest_distance_from_A}"
        #find index of smallest value in neighbour array 
        index_of_first_closest_neighbour = immediate_neighbours_to_A_array[0][0]
        puts "index of first neighbour: #{index_of_first_closest_neighbour}"
        distance_of_first_closest_neighbour = immediate_neighbours_to_A_array[0][1]
        puts "distance of first neighbour: #{distance_of_first_closest_neighbour}"
        node_of_closest_neighbour = nodes[index_of_first_closest_neighbour]
        puts "node of closest neighbour: #{node_of_closest_neighbour}"

        if (immediate_neighbours_to_A_array.size > 0 && (node_of_closest_neighbour == start_node_value))
            start_node_index = index_of_first_closest_neighbour
            distance_of_node_from_A = distance_of_first_closest_neighbour
            start_node_value = node_of_closest_neighbour
            immediate_neighbours_to_A_array = immediate_neighbours_to_A_array.drop(1)
            puts "new immediate_neighbours_to_A_array: #{immediate_neighbours_to_A_array}"
        end
    end 
        visited_nodes << start_node_value
        unvisited_nodes = unvisited_nodes.drop(1)
        puts "visited nodes: #{visited_nodes}"
        puts "new unvisited nodes: #{unvisited_nodes}"
        start_node_value = unvisited_nodes.first
end
puts "Shortest distance from A to C is #{shortest_distance_from_A[2]}"