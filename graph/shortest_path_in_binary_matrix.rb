# Shortest path in a Binary Maze
# Given a MxN matrix where each element can either be 0 or 1. We need to find the shortest path between a given source cell to a destination cell. 
# The path can only be created out of a cell if its value is 1.

# Example
# Input:
# grid = [[1, 1, 1, 1], 
# 		  [0, 0, 0, 1], 
# 		  [1, 1, 1, 1]]
# sr = 0, sc = 0, tr = 2, tc = 0
# output: 8

# QueueNode to store x,y and distance in queue
class QueueNode
	attr_accessor :x,:y,:dist

	def initialize(x,y,dist)
		@x = x
		@y = y
		@dist = dist
	end	
end

# Time Complexity = O(MN)
# Space Complexity = O(MN)  # For maintaining visited matrix.
# Find shortest path method
def shortest_path_binary_matrix(grid,sr,sc,tr,tc)
	# Return -1 if any of source or target is not equal to 1.
	if grid[sr][sc] != 1 || grid[tr][tc] != 1
		return -1
	end
    @rows = grid.size  # Find total rows in matrix
    @cols = grid[0].size  # Find total cols in matrix
    visited = Array.new(@rows) {Array.new(@cols) {false}  }  # Maintain visited matrix to keep track if cell is visited or not
    adj_rows = [-1,0,0,1]  # All possible direction adjacent rows
	adj_cols = [0,-1,1,0]  # All possible direction adjacent cols
    queue_node = QueueNode.new(sr,sc,0)  # Initialize queue_node with x,y and distance 0.
    q = [queue_node]  # Initialize queue and insert source cell to queue with distance 0 in form of queue_node.
    visited[sr][sc] = true  # Mark visited true for source cell.
    # Traverse queue while its not empty
    while !q.empty? do
    	popped_node = q.pop
    	# If popped_node is target cell, return distance.
    	if popped_node.x == tr && popped_node.y == tc
    		return popped_node.dist
    	end
    	# Push adjacent nodes to queue using adj_rows and adj_cols.
    	for i in 0..3 do
    		row = popped_node.x + adj_rows[i]
    		col = popped_node.y + adj_cols[i]
    		# If cell is valid and cell equals 1 and has not been visited.
    		# Enqueue item to queue and mark as visited.
    		if is_valid?(row,col) && grid[row][col] == 1 && visited[row][col] == false
    			queue_node = QueueNode.new(row,col,popped_node.dist+1)
    			q.unshift(queue_node)
    			visited[row][col] = true
    		end
    	end
    end
    return -1  # If whole matrix has been traversed and target cell not found, return -1.
end

private

def is_valid?(row,col)
	row >= 0 && row < @rows && col >= 0 && col < @cols
end	

grid = [
		[1, 1, 1, 1], 
		[1, 0, 0, 1], 
		[1, 1, 1, 1]
	]

puts shortest_path_binary_matrix(grid,0,0,2,0)

