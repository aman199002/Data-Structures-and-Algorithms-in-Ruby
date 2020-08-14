# Longest Palindrome

# Given a string which consists of lowercase or uppercase letters, find the length of the longest palindromes that can be built with those letters.
# This is case sensitive, for example "Aa" is not considered a palindrome here.

# Note:
# Assume the length of given string will not exceed 1,010.

# Example:
# Input: "abccccdd"
# Output: 7
# Explanation:
# One longest palindrome that can be built is "dccaccd", whose length is 7.

# @param {String} s
# @return {Integer}
def longest_palindrome(s)
    return 0 if s == nil || s == ''
    h1 = {}
    # Iterate string and convert to hash with each char as key and number of repeatitions as value.
    for i in 0..s.size-1 do
        if h1[s[i]]
            h1[s[i]] = h1[s[i]]+1
        else
            h1[s[i]] = 1
        end    
    end
    sum = 0  # Initialize sum with value 0.
    odd = false  # Flag to identify if hash contains any odd number in value. Initialize with 0.
    # Traverse hash.
    # Find sum for all chars by converting values to even numbers.
    # If there is a single odd value, add 1 to sum.
    h1.each do |k,v|
        if v%2 == 0
            val = v
        else
            val = v-1
            odd = true
        end
        sum = sum + val
    end
    sum = sum + 1 if odd
    return sum  # Return sum
end

puts longest_palindrome("abccccdda")
puts longest_palindrome("aabb")
puts longest_palindrome("Aabb")
puts longest_palindrome("")

