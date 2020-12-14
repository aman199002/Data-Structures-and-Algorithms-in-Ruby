# Palindrome Partitioning
# Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.
# A palindrome string is a string that reads the same backward as forward.

# Example:

# Input: s = "aab"
# Output: [["a","a","b"],["aa","b"]]

# Input: s = "a"
# Output: [["a"]]

def partition(s)
  @result = []
  dfs(s, [])
  return @result
end

private

def dfs(s, result_partition)
  if s.empty?
    @result << result_partition.dup
    return
  end

  (0..s.length-1).each do |i|
    prefix = s[0..i]
    postfix = s[(i+1)..-1]
    if is_palindrone?(prefix)
      result_partition << prefix
      dfs(postfix, result_partition)
      result_partition.pop
    end
  end
end

private

def is_palindrone?(s)
  start = 0 
  last = s.size-1
  while start <= last do
    if s[start] != s[last]
      return false
    end  
    start = start+1
    last = last-1
  end  
  return true
end 

print partition('aab')
puts
