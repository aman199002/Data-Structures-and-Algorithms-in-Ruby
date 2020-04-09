# Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

# Example

# Input: S = "ab#c", T = "ad#c". Output: true
# Explanation: Both S and T become "ac".

# Input: S = "ab##", T = "c#d#".  Output: true
# Explanation: Both S and T become "".

# Input: S = "a##c", T = "#a#c". Output: true
# Explanation: Both S and T become "c".

# Input: S = "a#c", T = "b". Output: false
# Explanation: S becomes "c" while T becomes "b".

# Time Complexity = O(n)
# Space Complexity = O(n)
def backspace_compare(s1,s2)
	get_filtered_string(s1) == get_filtered_string(s2)
end

private

def get_filtered_string(str)
	st = [] #Initializing an empty stack
	for i in 0..str.size-1 do
		if str[i] == '#'
			st.pop if !st.empty?
		else
			st.push(str[i])
		end
	end
	str = ''
	while !st.empty?
		popped_item = st.pop
		str << popped_item
	end
	str
end

puts backspace_compare('ab#c','ad#c')
puts backspace_compare('ab##','c#d#')
puts backspace_compare('a##c','#a#c')
puts backspace_compare('a#c','b')
puts backspace_compare('','')
puts backspace_compare('y#fo##f','y#f#o##f')