class Queue

	def initialize
		@q = Array.new
	end	

	def enqueue(i)
		@q.unshift i
		@q
	end	

	def dequeue
		@q.pop
	end
	
	def empty?
		@q.size == 0
	end

	def size
		@q.size
	end	

end

q = Queue.new
print q.enqueue(1)
print q.enqueue(2)
print q.enqueue(3)
print q.dequeue
# print q.enqueue(4)