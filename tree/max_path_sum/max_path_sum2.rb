# Binary Tree Maximum Path Sum
# Given a non-empty binary tree, find the maximum path sum.
# For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.

# Example
# Input: [-10,9,20,null,null,15,7]
#    -10
#    / \
#   9  20
#     /  \
#    15   7
# Output: 42

class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end	

# Time Complexity = O(n)
# Space Complexity = O(1)
def max_path_sum(node)
	@result = -2147483648  # Minimum value
	return @result if node == nil
    max_path_sum_util(node)
	@result
end

private

def max_path_sum_util(node)
	if node == nil
    	return 0
    end	
    left = max_path_sum_util(node.left)  # Recursive call to get left path sum
    right = max_path_sum_util(node.right)  # Recursive call to get right path sum
    # Calculate straight maximum sum. That can be (node+left),(node+right) or node only in case both left,right are negative.
    staight_max_sum = [[left,right].max + node.val, node.val].max
    # Calculate max case sum by comparing all cases (node+left),(node+right),node,(node+right+left)
    # As (node+left),(node+right),node calculated in staight_max_sum already.
    # So, compare staight_max_sum and (node+right+left) and store max in max_case_sum.
    # This is the maximum possible sum at current node by checking all possibilities    
    max_case_sum = [(node.val+left+right),staight_max_sum].max    
    @result = [@result,max_case_sum].max  # Compare max_case_sum with result and update result if result is less than max_case_sum
    return staight_max_sum  # Return straight max sum that will be used in recursion
end	

node = Node.new(-10)
node.left = Node.new(9)
node.right = Node.new(20)
node.right.left = Node.new(15)
node.right.right = Node.new(7)
puts max_path_sum(node)

node = Node.new(1)
node.left = Node.new(-2)
node.right = Node.new(3)
puts max_path_sum(node)

node = Node.new(2)
node.left = Node.new(-1)
puts max_path_sum(node)
