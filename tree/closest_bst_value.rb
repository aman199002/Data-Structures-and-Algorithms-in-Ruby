# Closest Binary Search Tree Value

# Given a non-empty binary search tree and a target value, find the value in the BST that is closest to the target.

# Note:
# Given target value is a floating point.
# You are guaranteed to have only one unique value in the BST that is closest to the target.

# Example:

# Input: root = [4,2,5,1,3], target = 3.714286
#     4
#    / \
#   2   5
#  / \
# 1   3

# Output: 4

# Definition for a binary tree node.
class Node
    attr_accessor :val, :left, :right

    def initialize(val)
        @val = val
    end

end

# @param {TreeNode} root
# @param {Float} target
# @return {Integer}
def closest_value(node, target)
    return if node == nil
    @a = []  # Initialize array
    # Call inorder function to store all elements in array in sorted order.
    inorder(node)
    prev = @a[0]  # Set first element from sorted array in prev variable.
    # Traverse for all elements in sorted array.
    for i in 1..@a.size-1 do
        # When element is greater than target, compare difference of target with previous element and current element.
        # Return element which is having least distance from target.
        if @a[i] > target
            return (prev - target).abs < (@a[i] - target).abs ? prev : @a[i]
        end    
        prev = @a[i]
    end
    # Return previous in case element is greater than all elements in given tree or only one node is there in BST.
    return prev
end

private

def inorder(node)
    if node == nil
        return
    end
    inorder(node.left)
    @a << node.val
    inorder(node.right)
end

node = Node.new(4)
node.left = Node.new(2)
node.right = Node.new(5)
node.left.left = Node.new(1)
node.left.right = Node.new(3)

puts closest_value(node,3.714286)

