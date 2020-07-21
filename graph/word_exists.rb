# Word Exists

# Solution
# Given a 2D board and a word, find if the word exists in the grid.

# The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

# Example:

# board =
# [
#   ['A','B','C','E'],
#   ['S','F','C','S'],
#   ['A','D','E','E']
# ]

# Given word = "ABCCED", return true.
# Given word = "SEE", return true.
# Given word = "ABCB", return false.

# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(a, word)
    return false if a==nil || a.size == 0
    m = a.size
    n = a[0].size
    visited = Array.new(m){Array.new(n)}
    for i in 0..m-1 do
        for j in 0..n-1 do
            if word[0] == a[i][j] && search_word(i,j,a,word,0,visited)
                return true
            end    
        end    
    end    
    return false
end

private 

def search_word(i,j,a,word,index,visited)
    if i < 0 || i >= a.size || j < 0 || j >= a[0].size || a[i][j] != word[index] || visited[i][j]
        return false
    end    
    visited[i][j] = true
    if index == word.size-1
        return true
    end    
    if search_word(i-1,j,a,word,index+1,visited) || search_word(i+1,j,a,word,index+1,visited) || search_word(i,j-1,a,word,index+1,visited) || search_word(i,j+1,a,word,index+1,visited)
        return true
    end    
    visited[i][j] = false
end

a = [
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]

puts exist(a,'ABCCED')
puts exist(a,'SEE')
puts exist(a,'ABCB')



