# String to Integer (atoi)
# Implement atoi which converts a string to an integer.
# The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
# The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
# If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
# If no valid conversion could be performed, a zero value is returned.

# Note:
# Only the space character ' ' is considered as whitespace character.
# Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.

# Example:
# Input: "42"
# Output: 42

# Example:
# Input: "   -42"
# Output: -42
# Explanation: The first non-whitespace character is '-', which is the minus sign. Then take as many numerical digits as possible, which gets 42.

# Example:
# Input: "4193 with words"
# Output: 4193
# Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.

# Example:
# Input: "words and 987"
# Output: 0
# Explanation: The first non-whitespace character is 'w', which is not a numerical digit or a +/- sign. Therefore no valid conversion could be performed.

# Example:
# Input: "-91283472332"
# Output: -2147483648
# Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer. Thefore INT_MIN (−231) is returned.

def my_atoi(str)
	s = get_correct_str(str)
    multiplier = 1
	if s[0] == '-'
		s[0] = ''
		multiplier = -1
    elsif s[0] == '+'
        s[0] = ''
    end
	return 0 if s == '' || !is_number?(s[0])
	num = 0
	for i in 0..s.size-1 do
		if s[i] >= '0' && s[i] <= '9'
			num = (num*10) + s[i].to_i
		else
			break
		end
	end
	return final_number(num,multiplier)
end

private

def get_correct_str(s)
	i = 0
	while s[0] == ' ' do
		s[0] = ''
	end
	return s
end

def is_number?(chr)
	chr >= '0' && chr <= '9'
end

def final_number(num,multiplier)
	max_num = 2**31
	if num >= max_num
		num = multiplier == -1 ? max_num : max_num - 1
	end	
	return(num*multiplier)
end

puts my_atoi('42')
puts my_atoi('-42')
puts my_atoi('  42 sadsa')
puts my_atoi('sadsa')
puts my_atoi('-91283472332')

