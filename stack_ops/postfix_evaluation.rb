# Implement a stack
class Stack
	
	def initialize
		@s = []
	end

	def push(i)
		@s << i
	end

	def pop
		@s.delete_at(@s.length-1)
	end
	
	def peak
		@s[0]
	end

	def empty?
		@s[0] == nil
	end	
	
end

def evaluate(exp)
	exp = exp.split(' ') # Convert from string to array separted by space
	res = nil
	st = Stack.new
	for i in 0..exp.length-1 do
		if is_integer?(exp[i]) # check if number
			st.push(string_to_number(exp[i])) # Push in stack by converting letter to number eg '2' => 2
		else # In case of Operator
			puts "res = #{res}"
			if res == nil
				res = eval("#{st.pop} #{exp[i]} #{st.pop}")
			else
				res = eval("#{res} #{exp[i]} #{st.pop}")
			end
		end
	end
	res
end

# Check if given letter is number
def is_integer?(char)
	char =~ /[0-9]/
end

# Convert string to number
def string_to_number(str)
	res = 0
	for i in 0..str.length-1 do
		res = (10 * res) + str[i].ord - '0'.ord
	end
	res
end	

exp = "5 10 2 * + 3 -"
# exp = "2 3 1 * + 9 -"
puts evaluate(exp)