# Vertical Order Traversal of a Binary Tree

# Given the root of a binary tree, calculate the vertical order traversal of the binary tree.
# For each node at position (row, col), its left and right children will be at positions (row + 1, col - 1) and (row + 1, col + 1) respectively. The root of the tree is at (0, 0).
# The vertical order traversal of a binary tree is a list of top-to-bottom orderings for each column index starting from the leftmost column and ending on the rightmost column. 
# There may be multiple nodes in the same row and same column. In such a case, sort these nodes by their values.
# Return the vertical order traversal of the binary tree.

# Example
#        1
#    /       \
#   2         3
#  / \       / \
# 4   6     5   7

# Input: root = [1,2,3,4,6,5,7]
# Output: [[4],[2],[1,5,6],[3],[7]]


# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end


# @param {TreeNode} root
# @return {Integer[][]}
def vertical_traversal(node)
    @h1 = {}
    vertical_traversal_util(node)
    res = @h1.sort.to_h.values
    return res
end

private

def vertical_traversal_util(node)
    q = [[node,0]]
    while !q.empty? do
        size = q.size
        level_vals = {}
        while size > 0 do
            popped_node,popped_level = q.pop
            size = size-1
            if level_vals[popped_level]
                level_vals[popped_level] = level_vals[popped_level] << popped_node.val
            else
                level_vals[popped_level] = [popped_node.val]
            end
            if popped_node.left
                q.unshift([popped_node.left,popped_level-1])
            end
            if popped_node.right
                q.unshift([popped_node.right,popped_level+1])
            end
        end
        level_vals.each do |k,v|
            if @h1[k]
                @h1[k] = @h1[k] + v.sort
            else
                @h1[k] = v.sort
            end
        end
    end
end

node = TreeNode.new(1)
node.left = TreeNode.new(2)
node.right = TreeNode.new(3)
node.left.left = TreeNode.new(4)
node.left.right = TreeNode.new(6)
node.right.left = TreeNode.new(5)
node.right.right = TreeNode.new(7)
print vertical_traversal(node)

