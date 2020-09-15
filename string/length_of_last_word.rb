# Length of Last Word

# Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word (last word means the last appearing word if we loop from left to right) in the string.
# If the last word does not exist, return 0.

# Note: A word is defined as a maximal substring consisting of non-space characters only.

# Example:

# Input: "Hello World"
# Output: 5

# @param {String} s
# @return {Integer}
def length_of_last_word(s)
    return 0 if s == nil || s.size == 0
    i = s.size-1
    count = 0
    while i > 0 && s[i] == ' ' do
        i = i-1
    end
    while i >= 0 && s[i] != ' ' do
        count = count+1
        i = i-1
    end
    return count
end

puts length_of_last_word("Hello World")
puts length_of_last_word("Hello World ")
puts length_of_last_word("Hello World  ")
puts length_of_last_word("   ")
puts length_of_last_word("")
puts length_of_last_word(" ")
puts length_of_last_word("a")
