# Surrounded Regions

# Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.
# A region is captured by flipping all 'O's into 'X's in that surrounded region.

# Example:
# X X X X
# X O O X
# X X O X
# X O X X

# After running your function, the board should be:
# X X X X
# X X X X
# X X X X
# X O X X

# Time Complexity = O(mn)
# Space Complexity = O(1)
def solve(a)
    return [] if a== nil || a.size == 0
    m = a.size
    n = a[0].size
    # Traverse the boundary elements.
    # If value equals O, convert it to 1 for all nearby elements included with dfs.
    for i in 0..m-1 do
        for j in 0..n-1 do
            if (i == 0 || j == 0 || i == m-1 || j == n-1) && a[i][j] == 'O'
                dfs(a,i,j,m,n)
            end
        end
    end
    # Traverse all elements in matrix.
    # If value equals 1, convert it to O.
    # If value equals O, flip it to X.
    for i in 0..m-1 do
        for j in 0..n-1 do
            if a[i][j] == '1'
                a[i][j] = 'O'
            elsif a[i][j] == 'O'
                a[i][j] = 'X'
            end
        end
    end
    return a  # Return matrix after all elements have been converted.
end

private

def dfs(a,i,j,m,n)
    if i < 0 || j < 0 || i >= m || j >= n || a[i][j] == 'X' || a[i][j] == '1'
        return
    end
    a[i][j] = '1'
    dfs(a,i-1,j,m,n)
    dfs(a,i,j-1,m,n)
    dfs(a,i+1,j,m,n)
    dfs(a,i,j+1,m,n)
end

# a = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","O","X"]]
a = [["X","X","X","X"],
     ["X","O","O","X"],
     ["X","X","O","X"],
     ["X","O","X","X"]]

print solve(a)
