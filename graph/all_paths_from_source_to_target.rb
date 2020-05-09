# Find all Paths From Source to Target

# Given a directed, acyclic graph of N nodes.  Find all possible paths from node 0 to node N-1, and return them in any order.
# The graph is given as follows:  the nodes are 0, 1, ..., graph.length - 1.  graph[i] is a list of all nodes j for which the edge (i, j) exists.

# Example:
# Input: [[1,2], [3], [3], []] 
# Output: [[0,1,3],[0,2,3]] 
# Explanation: The graph looks like this:
# 0--->1
# |    |
# v    v
# 2--->3
# There are two paths: 0 -> 1 -> 3 and 0 -> 2 -> 3.

# @param {Integer[][]} graph
# @return {Integer[][]}
# Use DFS to find all possible paths from source to target
def all_paths_source_target(graph)
  @res = []   # Iniliaze result variable to store final result
  @temp = []  # Iniliaze temp variable to store temporary path
  @temp << 0  # Add first node to temp as first will always be part of path
  solve(graph,0)  # Call this recursive function from first node
  return @res
end

private

def solve(graph,curr)
	# When current node is equal to last, means it has completed a path. So add temp to result and return.
	if curr == graph.size - 1
		@res << @temp.dup
		return
	end
	# For loop to traverse all directed nodes recursively.
	for i in 0..graph[curr].size-1 do
		# Store node value in temp as its part of possible path.
		@temp << graph[curr][i]
		# Call this function to go to next node and find path recursively.
		solve(graph,graph[curr][i])
		# After recursion, when it has traversed that node, remove node from temp for backtracking.
		@temp.pop
	end
end

print all_paths_source_target([[1,2],[3],[3],[]])