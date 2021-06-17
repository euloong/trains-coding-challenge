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
known_distance_from_A_array = [0, @infinity, @infinity, @infinity, @infinity]
puts "Initial state is: #{known_distance_from_A_array}"
#Start at A, which is index 0 in the adjacency_matrix
start_node_index = 0

#while unvisited_nodes.size > 0
    start_node_value = unvisited_nodes.first
    puts "Start node is: #{start_node_value}"
    visited_status_of_start_node = visited_nodes.include?(start_node_index)
    if (visited_status_of_start_node == false)
        calculated_distances_from_start_node_array = adjacency_matrix[start_node_index]
        puts "Calculated distances of neighbouring nodes from start node: #{calculated_distances_from_start_node_array}"
#find index of smallest value in array
        b = calculated_distances_from_start_node_array.sort
        index_of_closest_neigbour = calculated_distances_from_start_node_array.index(b.first)
        calculated_distances_from_closest_neighbour_node_array = adjacency_matrix[index_of_closest_neigbour]

        calculated_distances_from_closest_neighbour_node_array.each_with_index do |calculated_distance, index|
            puts "#{calculated_distance}"
            if ((calculated_distance < known_distance_from_A_array[index])  && calculated_distance > 0)
            known_distance_from_A_array[index] = calculated_distance
            puts "Known dist #{known_distance_from_A_array}"
            #end
               #  if calculated_distance_from_A[index] < known_distance_from_A[index]
                    # known_distance_from_A[index] = calculated_distance_from_A[index].zip(known_distance_from_A[index]).map { |x,y| x + y }
               # known_distance_from_A[index] = calculated_distance_from_A[index] + known_distance_from_A[index]
               #  end
            end
        end
        puts "New state is: #{known_distance_from_A_array}"
    end
    visited_nodes << start_node_value
    unvisited_nodes = unvisited_nodes.drop(1)
    puts "visited nodes: #{visited_nodes}"
    puts "new unvisited nodes: #{unvisited_nodes}"
    new_start_node = unvisited_nodes.first
    puts "new start node: #{new_start_node}"
    start_node_index += 1
    puts "start node index: #{start_node_index}"
#end