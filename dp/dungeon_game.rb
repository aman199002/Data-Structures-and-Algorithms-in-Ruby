# Dungeon Game

# The demons had captured the princess (P) and imprisoned her in the bottom-right corner of a dungeon. 
# The dungeon consists of M x N rooms laid out in a 2D grid. Our valiant knight (K) was initially positioned in the top-left room and must fight his way through the dungeon to rescue the princess.
# The knight has an initial health point represented by a positive integer. If at any point his health point drops to 0 or below, he dies immediately.
# Some of the rooms are guarded by demons, so the knight loses health (negative integers) upon entering these rooms; other rooms are either empty (0's) or contain magic orbs that increase the knight's health (positive integers).
# In order to reach the princess as quickly as possible, the knight decides to move only rightward or downward in each step.

# Write a function to determine the knight's minimum initial health so that he is able to rescue the princess.

# For example, given the dungeon below, the initial health of the knight must be at least 7 if he follows the optimal path RIGHT-> RIGHT -> DOWN -> DOWN.

# [[-2(K), -3,     3],
#  [-5,    -10,    1],
#  [10,    30,     -5(P)]]

# @param {Integer[][]} dungeon
# @return {Integer}
# Solving using bottom up approach.
# Will calculate value for last cell and then will be calculating for all previous cells.
def calculate_minimum_hp(a)
	return if a == nil || a.size == 0
	r = a.size
	c = a[0].size
	# Take another matrix sol of same size
    sol = Array.new(r){Array.new(c){}}
    # Calculate last cell value in sol matrix.
    # As the least health should be 1 after reaching last cell, so subtract given cell value from 1.
    # If value is less than 1 after subtraction then take 1 as minimum. So take max of subtracted value and 1.
    sol[r-1][c-1] = [(1 - a[r-1][c-1]),1].max
    i = r-2
    # Calculate values for each cell in last column.
    # Subtract down cell value from current cell of given matrix.
    # If subtracted value is less than 1, take 1.
    while i >= 0 do
    	sol[i][c-1] = [(sol[i+1][c-1] - a[i][c-1]),1].max
    	i = i-1
    end
    j = c-2
    # Calculate values for each cell in last row.
    # Subtract right cell value from current cell of given matrix.
    # If subtracted value is less than 1, take 1.
    while j >= 0 do
    	sol[r-1][j] = [(sol[r-1][j+1] - a[r-1][j]),1].max
    	j = j-1
    end
    i = r-2
    # Calculate all values excepting last row and last column.
    # Take min value of right and down cells from sol matrix.
    # Subtract min value from current cell of given matrix.
    # Take 1 if subtracted value is less than 1.
    # Keep calculating for all cells until completed.
    while i >= 0 do
    	j = c-2
    	while j >= 0 do
    		sol[i][j] = [([sol[i+1][j],sol[i][j+1]].min - a[i][j]),1].max
    		j = j-1
    	end	
    	i = i-1
    end
    # First cell will contain min initial health to reach to the last cell. So return its value.
    return sol[0][0] 
end

a = [[-2,-3,3],
	 [-5,-10,1],
	 [10,30,-5]]

puts calculate_minimum_hp(a)

# Sol matrix for above example will look like this:
# sol = [[7,5,2]
#		 [6,11,5]
#		 [1,1,6]]

