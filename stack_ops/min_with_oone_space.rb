class Stack

	def initialize
		@s = []
	end

	def push(i)
		if @s.empty?
			@s << i
			@min = i
		else
			if i >= @min
				@s << i
			else
				@s << (i - @min)
				@min = i
			end
		end	
	end

	def pop
		if @s.empty?
			raise "stack underflow"
		else
			popped_item = @s.pop
			if popped_item < 0
				@min = @min - popped_item
			end
		end
		@min
	end	

	def peek
		@s[-1]
	end	

	def find_min
		@min
	end	

end

def find_min(s)
	s.min
end

s = Stack.new
s.push(6)
s.push(-3)
s.push(4)
s.push(-2)
s.push(5)
s.push(2)
s.push(7)
s.pop
s.pop
print s.find_min