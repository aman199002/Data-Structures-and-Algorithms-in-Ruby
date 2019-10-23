def reverse(queue)
	stack = []
	while !queue.empty? do
		popped_item = queue.pop # Remove item from queue
		stack.push(popped_item) # Insert removed item into stack
	end
	while !stack.empty? do
		popped_item = stack.pop # Remove item from stack
		queue.unshift(popped_item) # Insert removed item into queue
	end
	queue
end

queue = [1,2,3,4,5]
print reverse(queue)