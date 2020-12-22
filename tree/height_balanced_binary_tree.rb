# Given a binary tree, determine if it is height-balanced.
# For this problem, a height-balanced binary tree is defined as:
# a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

# Example:

#           3 
#        /     \ 
#       9       20
#              /  \
#             15   7
#
# Input: root = [3,9,20,null,null,15,7]
# Output: true


#           1 
#        /     \ 
#       2       2
#     /   \
#    3     3
#  /   \
# 4     4
#
# Inout root = [1,2,2,3,3,null,null,4,4]
# Output: false

# Definition for a binary tree node.
class Node
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
    end
end

# @param {TreeNode} root
# @return {Boolean}
def is_balanced(node)
    val = is_balanced_util(node)
    return(val == false ? false : true)
end

private

def is_balanced_util(node)
    if node == nil
        return 0
    end    
    lh = is_balanced_util(node.left)
    rh = is_balanced_util(node.right)
    if lh == false || rh == false || (lh - rh).abs > 1
        return false
    elsif lh > rh
        return lh+1
    else    
        return rh+1
    end
end

node = Node.new(3)
node.left = Node.new(9)
node.right = Node.new(20)
node.right.left = Node.new(15)
node.right.right = Node.new(7)

puts is_balanced(node)


node = Node.new(1)
node.left = Node.new(2)
node.right = Node.new(2)
node.left.left = Node.new(3)
node.left.right = Node.new(3)
node.left.left.left = Node.new(4)
node.left.left.right = Node.new(4)

puts is_balanced(node)
