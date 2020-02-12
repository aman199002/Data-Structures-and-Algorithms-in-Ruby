# @param {Integer[]} heights
# @return {Integer}
# Time Complexity O(n)
# Space Complexity O(n)
def largest_rectangle_area(a)
	s = [] # Initialize stack in form of array.
	i = 0
	max_area = 0
	while i < a.size do
		# Push first element to stack if empty or if stack's top element is smaller.
		if s.empty? || a[s[-1]] < a[i]
			s.push(i)
			i = i+1
		# If stack's top element is greater than next element, then pop and calculate area.
		else
			# print "s = #{s}"
			# puts
			top = s.pop
			if s.empty?
				area = a[top] * i
			else
				area = a[top] * (i- s[-1] - 1)
			end
			max_area = area if area > max_area # Update max_area if area is greater than max_area.
		end
	end
	# Unless stack is empty, keep popping from stack and calculate area. Update max area accordingly.
	while !s.empty? do
		top = s.pop
		if s.empty?
			area = a[top] * i
		else
			area = a[top] * (i- s[-1] - 1)
		end
		max_area = area if area > max_area
	end	
	max_area
end	

puts largest_rectangle_area([2,1,5,6,2,3])
puts largest_rectangle_area([2])