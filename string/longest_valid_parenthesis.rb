# Longest Valid Parentheses

# Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

# Example:

# Input: s = "(()"
# Output: 2
# Explanation: The longest valid parentheses substring is "()".

# Input: s = ")()())"
# Output: 4
# Explanation: The longest valid parentheses substring is "()()".

# Input: s = ""
# Output: 0

# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
    st =[]  # Initialize empty stack
    # Push -1 to the stack to track the beginning index as we will be first poppping out from stack when a closing bracket occurs 
    # and then calculate the difference by subtracting stack peek element from current string index.
    st.push(-1)    
    max_len = 0
    for i in 0..s.size-1 do
        # Push index in the stack if opening bracket occurs
        if s[i] == '('
            st.push(i)
        # Otherwise first pop from stack
        else
            st.pop
            # If stack gets empty, push current index to keep track of beginning of new substring.
            if st.empty?
                st.push(i)
            # Peek element in stack will contain beginning index of valid substring.
            # Now find difference by subtracting peek element from stack with string current index.
            # Update max length if difference is greater than previous max length.
            else
                curr_len = i - st[-1]
                max_len = [curr_len,max_len].max
            end    
        end    
    end    
    return max_len   # Return max length.
end

puts longest_valid_parentheses(")()())")
puts longest_valid_parentheses("((()))")
