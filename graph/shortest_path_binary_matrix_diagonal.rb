# LeetCode 1091: Shortest Path in Binary Matrix including all directions left,right,top,bottom,diagonal

# In an N by N square grid, each cell is either empty (0) or blocked (1).

# A clear path from top-left to bottom-right has length k if and only if it is composed of cells C_1, C_2, ..., C_k such that:

# Adjacent cells C_i and C_{i+1} are connected 8-directionally (ie., they are different and share an edge or corner)
# C_1 is at location (0, 0) (ie. has value grid[0][0])
# C_k is at location (N-1, N-1) (ie. has value grid[N-1][N-1])
# If C_i is located at (r, c), then grid[r][c] is empty (ie. grid[r][c] == 0).
# Return the length of the shortest such clear path from top-left to bottom-right.  If such a path does not exist, return -1.

# Example 1:

# Input: [[0,1],
# 		  [1,0]]
# Output: 2

# Input: [[0,0,0],
#         [1,1,0],
#         [1,1,0]]
# Output: 4

# QueueNode to store x,y and distance in queue.
class QueueNode
	attr_accessor :x,:y,:dist

	def initialize(x,y,dist)
		@x = x
		@y = y
		@dist = dist
	end	
end

# @param {Integer[][]} grid
# @return {Integer}
def shortest_path_binary_matrix(grid)
    shortest_path_util(grid,0,0,grid.size-1,grid[0].size-1)
end

private

# Shortest path utility method
def shortest_path_util(grid,sr,sc,tr,tc)
	# Return -1 if any of source or target is not equal to 0.
    if grid[sr][sc] != 0 || grid[tr][tc] != 0
		return -1
	end
    @rows = grid.size
    @cols = grid[0].size
    visited = Array.new(@rows) {Array.new(@cols) {false}  }  # Maintain visited matrix to keep track if cell is visited or not
    adj_rows = [-1,0,0,1,-1,-1,1,1]  # All possible direction adjacent rows including diagonals.
	adj_cols = [0,-1,1,0,-1,1,-1,1]  # All possible direction adjacent cols including diagonals.
    queue_node = QueueNode.new(sr,sc,1)  # Initialize queue_node with x,y and distance 1. As first is included in distance as per question statement.
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
    	for i in 0..7 do
    		row = popped_node.x + adj_rows[i]
    		col = popped_node.y + adj_cols[i]
    		# If cell is valid and cell equals 0 and has not been visited.
    		# Enqueue item to queue and mark as visited.
    		if is_valid?(row,col) && grid[row][col] == 0 && visited[row][col] == false
    			queue_node = QueueNode.new(row,col,popped_node.dist+1)
    			q.unshift(queue_node)
    			visited[row][col] = true
    		end
    	end
    end
    return -1  # If whole matrix has been traversed and target cell not found, return -1.
end    

def is_valid?(row,col)
	row >= 0 && row < @rows && col >= 0 && col < @cols
end

grid = [[0,0,0],
		[1,1,0],
		[1,1,0]]
puts shortest_path_binary_matrix(grid)
grid = [[0,1],
		[1,0]]
puts shortest_path_binary_matrix(grid)


