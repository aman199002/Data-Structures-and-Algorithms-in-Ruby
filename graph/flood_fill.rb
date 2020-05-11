# Flood Fill
# Solution
# An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).
# Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.
# To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, 
# plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.

# At the end, return the modified image.

# Example 1:

# Input: 
# image = [[1,1,1],[1,1,0],[1,0,1]]
# sr = 1, sc = 1, newColor = 2
# Output: [[2,2,2],[2,2,0],[2,0,1]]
# Explanation: 
# From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected 
# by a path of the same color as the starting pixel are colored with the new color.
# Note the bottom corner is not colored 2, because it is not 4-directionally connected
# to the starting pixel.

# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} new_color
# @return {Integer[][]}
def flood_fill(image, sr, sc, new_color)
	# If source cell color equal to new_color, return
	if image[sr][sc] == new_color
		return image
	end
    rows = image.size
    cols = image[0].size
    source = image[sr][sc]
    # Call dfs to traverse all nodes
    dfs(image, sr, sc, new_color,rows,cols,source)
    return image
end

private

def dfs(image, sr, sc, new_color,rows,cols,source)
	# Base condition to avoid invalid paths
	if sr < 0 || sr >= rows || sc < 0 || sc >= cols
		return
	elsif image[sr][sc] != source # If image cell is not equal to source, return
		return
	end
	image[sr][sc] = new_color  # Set image cell equal to new color
	# Call dfs for all 4 directions and update each cell where color equals source.
	dfs(image, sr-1, sc, new_color,rows,cols,source)
	dfs(image, sr+1, sc, new_color,rows,cols,source)
	dfs(image, sr, sc-1, new_color,rows,cols,source)
	dfs(image, sr, sc+1, new_color,rows,cols,source)
end	

print flood_fill([[1,1,1],[1,1,0],[1,0,1]],1,1,2)