class Queue
	
	# Constructor in ruby
	# Initalize s1,s2 at the time time object creation and use as stacks
	def initialize
		@s1 = [] 
		@s2 = []
	end	

	# Implement enqueue method
	def enqueue(element)
		while !@s1.empty? do
			@s2.push(@s1.pop)
		end
		@s1.push(element)
		while !@s2.empty? do
			@s1.push(@s2.pop)
		end
	end
	
	# Implement dequeue method
	def dequeue
		@s1.pop
	end	

end

queue = Queue.new # Created a new object
queue.enqueue(8)
queue.enqueue(4)
queue.enqueue(9)
queue.enqueue(2)
queue.enqueue(1)
queue.enqueue(7)
queue.enqueue(6)
queue.enqueue(5)

puts queue.dequeue
puts queue.dequeue
puts queue.dequeue