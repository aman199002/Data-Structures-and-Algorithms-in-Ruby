class Stack

	# Constructor in ruby
	def initialize
		@q1 = Queue.new # Created queue object @q1
		@q2 = Queue.new # Created queue object @q2
	end
	
	# Implemented stack push method
	def push(element)		
		while !@q1.empty? do
			@q2.enq(@q1.pop) # Dequeue element from queue q1 and enque the same to q2
		end
		@q1.enq(element)
		while !@q2.empty? do
			@q1.enq(@q2.pop) # Dequeue element from queue q2 and enque the same to q1
		end	
	end

	# Implemented stack pop method
	def pop
		return nil if @q1.empty?
		@q1.pop # Dequeue element from queue and return the same 
	end

end

s1 = Stack.new
s1.push(8)
s1.push(4)
s1.push(9)
s1.push(2)
s1.push(1)
s1.push(7)
s1.push(6)
s1.push(5)
puts s1.pop # Print popped item
puts s1.pop
puts s1.pop