# Course Schedule
# There are a total of numCourses courses you have to take, labeled from 0 to numCourses-1.
# Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]
# Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?

# Example:

# Input: numCourses = 2, prerequisites = [[1,0]]
# Output: true
# Explanation: There are a total of 2 courses to take. To take course 1 you should have finished course 0. So it is possible.

# Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
# Output: false
# Explanation: There are a total of 2 courses to take. To take course 1 you should have finished course 0, 
# and to take course 0 you should also have finished course 1. So it is impossible.

# Using dfs, finding if cycle exists for any course.
def can_finish(num_courses, prerequisites)
	# Return if num_courses is 0 or prerequisites is empty 
    return true if num_courses == nil || num_courses == 0 || prerequisites == nil || prerequisites.size == 0
    visited = Array.new(num_courses){}
    h1 = {} # Hash to store all dependant courses for each course 
    for i in 0..prerequisites.size-1 do
    	if h1[prerequisites[i][1]]
    		h1[prerequisites[i][1]] = (h1[prerequisites[i][1]] << prerequisites[i][0])  # Update dependant courses array
    	else
    		h1[prerequisites[i][1]] = [prerequisites[i][0]]  # Add dependant in form of array
    	end
    end
    for i in 0..num_courses.size-1 do
    	# Check for each course if its cyclic
    	if is_cyclic(h1,visited,i)
    		return false
    	end
    end
    return true
end

private

def is_cyclic(h1,visited,curr)
	# If element has been marked processed and appear again, means it is cyclic. Return true.
	if visited[curr] == 2
		return true
	end
	# Set curr element in visited array to 2 when start processing
	visited[curr] = 2
	# Check if key exists in hash
	if h1[curr]
		# Traverse for all values and check if any node is cyclic
		h1[curr].each do |j|
			if is_cyclic(h1,visited,j)
				return true  # Return true when any node is cyclic
			end
		end
	end
	# When node has been visited with all adjacent nodes, mark it visited by setting value to 1.
	visited[curr] = 1
	return false  # Return false if all nodes have been traversed and cycle is not found
end

puts can_finish(2, [[1,0]])
puts can_finish(2, [[1,0],[0,1]])
