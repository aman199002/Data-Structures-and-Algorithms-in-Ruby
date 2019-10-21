class Queue

	def initialize(size)
		@size = size
		@store = Array.new(@size)
		@head = -1
		@tail = 0
	end

	def enqueue(element)
		if full? || element.nil?
			nil
		else
			@tail = @tail.pred
			@store[@tail] = element
			puts "@tail = #{@tail}"
			puts "@store[@tail] = #{@store[@tail]}"
			self
		end
		print @store
	end

	def dequeue
		if empty?
			nil
		else
			@tail = @tail.succ
			dequeued = @store[@head]
			@store.unshift(nil)
			@store.pop
			dequeued
		end	
		print @store
	end

	def diaplay
		puts @store
	end	

	private
	
	def full?
		@tail.abs == @size
	end	
	
	def empty?
		@head == -1 && @tail == 0
	end	

end

q = Queue.new(4)
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.dequeue