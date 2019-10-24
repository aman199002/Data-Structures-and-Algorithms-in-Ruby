# Plugin/gem for priority queue in ruby
require 'pqueue'

class MedianFinder

	def initialize
		@firstq = PQueue.new # Max heap
		@secq = PQueue.new(){|a,b| a < b} # Min heap
	end	

	def add_num(num)		
		if @firstq.empty? || @firstq.top >= num # Add to first queue if empty or item is smaller than top, otherwise second
			@firstq.push(num)
		else
			@secq.push(num)
		end

		if @firstq.size == @secq.size + 2   # Rebalance queues if any queue is having more than one elements greater than other. Pop from once queue and push to other
			@secq.push(@firstq.pop)
		elsif @firstq.size + 2 == @secq.size
			@firstq.push(@secq.pop)
		end	
	end

	# Find median
	def find_median
		if @firstq.size ==  @secq.size # Return average if size of both queues is same
			median = (@firstq.top + @secq.top)/2.0 
		elsif @firstq.size == @secq .size+ 1 # Return top of first queue is its size is greater
			median = @firstq.top
		else # Else return top of second queue as its size iwill be greater
			median = @secq.top
		end
		return median
	end	

end

obj = MedianFinder.new
obj.add_num(2)
obj.add_num(4)	
obj.add_num(5)
puts obj.find_median
obj.add_num(6)
obj.add_num(17)
puts obj.find_median
obj.add_num(1)
obj.add_num(3)
puts obj.find_median
obj.add_num(16)
puts obj.find_median