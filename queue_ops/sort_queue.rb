def find_min_index(queue,sort_index)
	min_index = -1
	min_value = Float::INFINITY # Take some max number
	for i in 0..queue.size-1 do
		curr = queue.pop # Remove element from queue
		if curr <= min_value && i <= sort_index
			min_index = i
			min_value = curr
		end
		queue.enq(curr) # Enqueue in ruby
	end
	return min_index
end

def insert_to_queue(queue,min_index)
	for i in 0..queue.size-1 do
		curr = queue.pop
		if i != min_index
			queue.enq(curr) # Enqueue in ruby
		else
			min_value = curr
		end
	end
	queue.enq(min_value) # Enqueue in ruby
end	

queue = Queue.new
queue.enq(8)
queue.enq(4)
queue.enq(9)
queue.enq(2)
queue.enq(1)
queue.enq(7)
queue.enq(6)
queue.enq(5)

for i in (0..queue.size-1) do
	min_index = find_min_index(queue, (queue.size - 1 - i))
	insert_to_queue(queue,min_index)
end

while(!queue.empty?) do
	print queue.pop
	print " "
end