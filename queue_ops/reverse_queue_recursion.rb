def reverse(queue)
	if queue.empty?
		return queue
	else
		popped_item = queue.pop # Remove element from queue
		reverse(queue) # Call reverse function again after removing element from queue
		queue.unshift(popped_item)	# Insert element to queue
	end
	queue
end

queue = [1,2,3,4,5]
print reverse(queue)