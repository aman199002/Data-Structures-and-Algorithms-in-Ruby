# Queue Reconstruction by Height

# Suppose you have a random list of people standing in a queue. Each person is described by a pair of integers (h, k), 
# where h is the height of the person and k is the number of people in front of this person who have a height greater than or equal to h. Write an algorithm to reconstruct the queue.

# Time Compexity = O(nlogn + n^2)
# Space Compexity = O(1)
def reconstruct_queue(people)
	return [] if people == nil || people.size == 0
	# Sort people array in descending order by height.
	# If height is equal in some case, then sort in ascending order by k i.e no. of people in subarray.
	people = people.sort do |p1,p2|
				if p1[0] == p2[0]
					p1[1] <=> p2[1]
				else
					p2[0] <=> p1[0]
				end
			 end
	result = []  # Initialize array to store output.
	# Traverse people array and insert subarray in result at index k i.e second element of subarray.
	for i in 0..people.size-1 do
		result.insert(people[i][1],people[i])
	end
	return result  # Return result array
end

print reconstruct_queue([[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]])
puts
print reconstruct_queue([[9,0],[7,0],[1,9],[3,0],[2,7],[5,3],[6,0],[3,4],[6,2],[5,2]])
