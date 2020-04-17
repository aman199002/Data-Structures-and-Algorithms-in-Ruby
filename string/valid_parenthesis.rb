# Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:

# Any left parenthesis '(' must have a corresponding right parenthesis ')'.
# Any right parenthesis ')' must have a corresponding left parenthesis '('.
# Left parenthesis '(' must go before the corresponding right parenthesis ')'.
# '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
# An empty string is also valid.

# Example 1:
# Input: "()"
# Output: True

# Input: "(*))"
# Output: True

# Time Complexity = O(n)
# Space Complexity = O(1)
def check_valid_string(s)
	return true if s.empty?
	low = 0
	high = 0
	for i in 0..s.size-1 do
		if s[i] == '('
			low = low+1
			high = high+1
		elsif s[i] == ')'
			if low > 0
				low = low-1
			end	
			high = high-1
		else
			if low > 0
				low = low-1
			end
			high = high+1
		end
		if high < 0
			return false
		end
	end
	low == 0
end

puts check_valid_string("())")
puts check_valid_string("*((*")
puts check_valid_string("(((**)")
puts check_valid_string("(((*))")
puts check_valid_string("())(")
puts check_valid_string("(((******))")
puts check_valid_string("(((******)))")
puts check_valid_string("(())((())()()(*)(*()(())())())()()((()())((()))((*")
puts check_valid_string("(((((()*)(*)*))())())(()())())))((**)))))(()())()")
puts check_valid_string("((()))()(())(*()()())**(())()()()()((*()*))((*()*)")	