# Valid Parentheses
# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# An input string is valid if:

# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
 
# Example:

# Input: s = "()"
# Output: true

# Input: s = "()[]{}"
# Output: true

# Input: s = "(]"
# Output: false

# @param {String} s
# @return {Boolean}
def is_valid(s)
	return true if s == ''
    st = []
    size = s.size
    for i in 0..size-1 do
    	if s[i] == '(' || s[i] == '{' || s[i] == '['
    		st.push(s[i])
    	else
    		case s[i]
    		when ')'
				if st[-1] == '('
					st.pop
				else
					return false	
				end	
			when '}'
				if st[-1] == '{'
					st.pop
				else
					return false	
				end	
			when ']'
				if st[-1] == '['
					st.pop
				else
					return false
				end	
			end			
    	end	
    end	
    return(st.empty? ? true : false)
end

puts is_valid('{(}')
puts is_valid('[{()}]')
puts is_valid('{)}')
