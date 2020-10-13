# Buddy Strings

# Given two strings A and B of lowercase letters, return true if you can swap two letters in A so the result is equal to B, otherwise, return false.
# Swapping letters is defined as taking two indices i and j (0-indexed) such that i != j and swapping the characters at A[i] and A[j]. 
# For example, swapping at indices 0 and 2 in "abcd" results in "cbad".

# Example:

# Input: A = "ab", B = "ba"
# Output: true
# Explanation: You can swap A[0] = 'a' and A[1] = 'b' to get "ba", which is equal to B.

# Input: A = "ab", B = "ab"
# Output: false
# Explanation: The only letters you can swap are A[0] = 'a' and A[1] = 'b', which results in "ba" != B.

# Input: A = "aa", B = "aa"
# Output: true
# Explanation: You can swap A[0] = 'a' and A[1] = 'a' to get "aa", which is equal to B.

# Input: A = "aaaaaaabc", B = "aaaaaaacb"
# Output: true

# Input: A = "", B = "aa"
# Output: false

# @param {String} a
# @param {String} b
# @return {Boolean}
# Time Complexity = O(n)
# Space Complexity = O(n)
def buddy_strings(a, b)
    return false if a.size != b.size
    if a == b
        h1 = {}
        for i in 0..a.size-1 do
            h1[a[i]] = h1[a[i]] ? h1[a[i]]+1 : 1
        end
        return(h1.any?{|k,v| v > 1})
    end
    mismatches_a = []
    mismatches_b = []
    for i in 0..a.size-1 do
        if a[i] != b[i]
            mismatches_a << a[i]
            mismatches_b << b[i]
        end
    end
    if mismatches_a.size == 2 && mismatches_a == mismatches_b.reverse
        return true
    else
        return false
    end
end

puts buddy_strings("ab","ba")
puts buddy_strings("aba","ba")
puts buddy_strings("aaaaa","aaaaa")
puts buddy_strings("aaaab","baaaa")
