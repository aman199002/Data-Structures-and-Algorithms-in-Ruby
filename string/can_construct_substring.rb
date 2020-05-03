# Ransom Note
# Given an arbitrary ransom note string and another string containing letters from all the magazines, 
# write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.
# Each letter in the magazine string can only be used once in your ransom note.
# Note:
# You may assume that both strings contain only lowercase letters.

# Example:
# canConstruct("a", "b") -> false
# canConstruct("aa", "ab") -> false
# canConstruct("aa", "aab") -> true

# Time Complexity = O(n)
# Space Complexity = O(n)
# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
  # Return true if both string are empty.
  return true if ransom_note.empty? && magazine.empty?
  h1 = {}  # Initialize empty hash.
  # Iterate ransom_note string and store count of each character in hash.
  for i in 0..ransom_note.size-1 do
     if h1[ransom_note[i]]
         h1[ransom_note[i]] = h1[ransom_note[i]] + 1
     else
         h1[ransom_note[i]] = 1
     end
  end
  sum = h1.values.sum   # Find sum of all values from hash.
  for j in 0..magazine.size-1 do
    # Decrement value and sum when character is present in hash.
    # Subtract only those number of times for which elements are present in ransom_note.
    if h1[magazine[j]] && h1[magazine[j]] > 0
       h1[magazine[j]] = h1[magazine[j]] - 1
       sum = sum - 1
    end
    # When sum reaches 0, means all elements have been found till this point. So don't traverse further and return.
    return true if sum == 0
  end
  # Return false if sum is not 0 by traversing till end of the string.
  return false
end

puts can_construct("bg","efjbdfbdgfjhhaiigfhbaejahgfbbgbjagbddfgdiaigdadhcfcj")
puts can_construct("aa","bb")
puts can_construct("aa","aab")