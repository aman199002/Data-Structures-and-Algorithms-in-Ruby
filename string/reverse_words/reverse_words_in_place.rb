# Reverse Words in a String II

# Given a character array s, reverse the order of the words.
# A word is defined as a sequence of non-space characters. The words in s will be separated by a single space.

 
# Example:
# Input: s = ["t","h","e"," ","s","k","y"," ","i","s"," ","b","l","u","e"]
# Output: ["b","l","u","e"," ","i","s"," ","s","k","y"," ","t","h","e"]

# Input: s = ["a"]
# Output: ["a"]

# Follow up: Do it in-place without allocating extra space?

# Time Complexity = O(n)
# Space Complexity = O(1)
def reverse_words(s)
    # First reverse the whole array
    i,j = 0,s.size-1
    while i < j do
        s[i],s[j] = s[j],s[i]
        i = i+1
        j = j-1
    end    
    k = 0   # Initialize k to 0 i.e beginning of first word.
    while k < s.size do
        i,j = k,k   # Initialize i and j with beginning of the word.
        # Initialize i and j equal to k. Move j unitll space is found or array is ended.
        while j < s.size && s[j] != ' ' do
            j = j+1
        end    
        k = j+1   # Next word will start after space, so increment k by 1
        j = j-1   # Word will end before space, so decrement j by 1.
        # Now we have begining and last position of a word.
        # Reverse characters of the word by incrementing i and decrementing j.
        while i < j do
            s[i],s[j] = s[j],s[i]
            i = i+1
            j = j-1
        end    
    end
    return s   # String has been reversed in place. Return it.
end    

print reverse_words(["t","h","e"," ","s","k","y"," ","i","s"," ","b","l","u","e"])
puts
print reverse_words(["a"])
puts
print reverse_words(["a","b"])
