# Minimum Window Substring

# Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

# Example:
# Input: S = "ADOBECODEBANC", T = "ABC"
# Output: "BANC"


# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
    h1 = {}
    missing = t.size
    longest = Float::INFINITY
    res = ''
    for i in 0..t.size-1 do
        if h1[t[i]]
           h1[t[i]] = h1[t[i]] + 1           
        else
            h1[t[i]] = 1    
        end    
    end 
    l = 0
    r = 0
    while r < s.size do
        if h1[s[r]]
            missing = missing - 1 if h1[s[r]] > 0
            h1[s[r]] = h1[s[r]] - 1
        end    
        r = r+1
        while missing == 0 do
            if h1[s[l]]
                missing = missing+1 if h1[s[l]] >= 0
                h1[s[l]] = h1[s[l]]+1                
            end    
            if r-l < longest
                res = s[l..(r-1)]
                longest = res.size
            end
            l = l+1
        end    
    end    
    return res
end

puts min_window('ADOBECODEBANC', 'ABC')
puts min_window('ab', 'a')
