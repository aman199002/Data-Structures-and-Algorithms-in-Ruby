# Implement a stack
class Stack
	def initialize
		@s = []
	end	

	def push(n)
		@s << n
	end	

	def pop
		@s.delete_at(@s.length - 1)
	end

	def peak
		@s[@s.length - 1]
	end

	def empty?
		@s[0] == nil
	end	
	
end

# Find next greater element
def find_nge(a)
	s = Stack.new
	for i in 0..a.length-1 do
		# Push element to stack if empty
		if s.empty?
			s.push(a[i])
			next
		end
		# If next element is greater than stack peak element, then first print and then pop from stack. Repeat till next element is greater than peak.
		if s.peak < a[i]
			while s.peak < a[i] do
				puts "#{s.peak} -> #{a[i]}"
				s.pop
				s.push(a[i]) if s.empty?
			end	
		end
		# If next element is less than stack peak element, then push next element into stack
		if s.peak > a[i]
			s.push(a[i])
		end
	end
	# Print -1 for stack peak element and then pop untill stack is empty
	if !s.empty?
		while !s.empty?
			puts "#{s.peak} -> -1"
			s.pop
		end	
	end	
end

arr = [11, 13, 21, 3, 18, 5]
# arr = 4, 5, 2, 25, 7, 32, 8, 6
find_nge(arr)
