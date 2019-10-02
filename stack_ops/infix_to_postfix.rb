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

def convert(exp)
	operands = []
	operators = Stack.new
	for i in 0..exp.length-1 do
		if is_letter?(exp[i])
			operands << exp[i]
		else
			# Swich case
			case
				when exp[i] == ' '
					next
				when exp[i] == '('
					operators.push(exp[i])
				when exp[i] == ')'
					while operators.peak != '(' do
						item = operators.pop
						operands << item
					end					
					operators.pop
				else
				 	while !operators.empty? && exp[i] <= operators.peak do
				 		operands << operators.pop
				 	end
					operators.push(exp[i])
			end				
		end	
	end	
	while !operators.empty?	do
		operands << operators.pop		
	end	
	return operands.join('')
end

# Check if given character is alphabet or not
def is_letter?(char)
	char =~ /[A-Za-z]/
end	


exp = "(A+B) * (C-D)"
print convert(exp)