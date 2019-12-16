# Time Complexity O(n)
# Space Complexity O(n)
def find_next_greater(a)
	stack = Array.new # Create stack in form of array.
	stack.push(a[0])  # Push first element to stack.
	for i in 1..a.size-1 do
		next_e = a[i]  
		# Compare next element with top element from stack.
		# Keep popping from stack and print next till previous elements are smaller.
		while !stack.empty? && next_e > stack[-1] do
			stack.pop
			print next_e
			print ' '			
		end
		# Push next element to stack
		stack.push(next_e)
	end
	# If array has been traversed and stack is not empty, it means all elements in stack are smaller.
	# Keep popping and print -1.
	while !stack.empty? do		
		stack.pop
		print -1
		print ' '
	end
end

# find_next_greater([11,8,7,6,20])
# find_next_greater([11,13,21,3])
find_next_greater([40, 5, 2, 25])