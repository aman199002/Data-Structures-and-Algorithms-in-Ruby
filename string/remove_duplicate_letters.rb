# Remove Duplicate Letters

# Given a string s, remove duplicate letters so that every letter appears once and only once. 
# You must make sure your result is the smallest in lexicographical order among all possible results.

# Example:

# Input: s = "bcabc"
# Output: "abc"

# Input: s = "cbacdcbc"
# Output: "acdb"

# @param {String} s
# @return {String}
def remove_duplicate_letters(s)
    return '' if s == nil || s.size == 0
    res = ''
    st = []
    seen = {}
    last_occurence = {}
    # Store last occurence of each char in form of hash.
    for i in 0..s.size-1 do
        last_occurence[s[i]] = i
    end
    for i in 0..s.size-1 do
        # We can only try to add char if it's not already in our solution
        # This is to maintain only one of each character
        if !seen[s[i]]
            # 1. Stack is not empty
            # 2. Previous letter is greater than current letter
            # 3. Current index is smaller than last occurence of previous letter
            # we remove it from the stack to keep the solution optimal.
            while !st.empty? && s[st[-1]] > s[i] && i < last_occurence[s[st[-1]]]
                popped_index = st.pop
                seen.delete(s[popped_index])
            end
            st.push(i)
            seen[s[i]] = true
        end
    end
    while !st.empty? do
        res << s[st.pop]
    end
    return(res.reverse)
end
