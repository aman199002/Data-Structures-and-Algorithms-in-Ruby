# Cousins in Binary Tree

# In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.
# Two nodes of a binary tree are cousins if they have the same depth, but have different parents.
# We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.
# Return true if and only if the nodes corresponding to the values x and y are cousins.

# Example:
# 		1
# 	2		3	
# 4
# Input: root = [1,2,3,4], x = 4, y = 3, Output: false

# 			1
# 	2				3	
# 		4				5
# Input: root = [1,2,3,4], x = 5, y = 4, Output: true


class Node
	attr_accessor :left,:right, :val

	def initialize(val)
		@val = val
	end	

end	

# The main intention here is to check if level of both the given elements is same and their parents are different.
# So, maintning level and parent for both the elements in hash.
# Call utility function and store elements level and parent in hash.
# Check if both the elements exist in hash and match our condition.
# Return true if condition is matched, else false.
def is_cousins(node, x, y)
	return false if node == nil
	@h1 = {}  # Inialize an emoty hash
    is_cousins_util(node, x, y,0)
    if (@h1[x] && @h1[y]) && (@h1[x][0] == @h1[y][0] && @h1[x][1] != @h1[y][1])
    	return true
    else 
    	return false	
    end	
end

private

def is_cousins_util(node, x, y,level)
	if node == nil
		return
	end
	# If node val equals x or y, then store node value as key and level as value in form of array amd return it.
	if node.val == x || node.val == y
		@h1[node.val] = [level]
		return @h1[node.val]
	end	
	left = is_cousins_util(node.left,x,y,level+1)
	# If left is not nil, then insert node value i.e parent in hash value which is an array.
	if left != nil
		left << node.val
	end
	right = is_cousins_util(node.right,x,y,level+1)
	# If right is not nil, then insert node value i.e parent in hash value which is an array.
	if right != nil
		right << node.val
	end
	return nil # Return nil as we are already maintaining required data in hash
end	

node = Node.new(1)
node.left = Node.new(2)
node.right = Node.new(3)
node.left.right = Node.new(4)
node.right.right = Node.new(5)
puts is_cousins(node,1,3)
