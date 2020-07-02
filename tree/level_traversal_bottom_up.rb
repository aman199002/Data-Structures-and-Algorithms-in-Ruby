# Binary Tree Level Order Traversal II

# Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

# For example:
# Given binary tree [3,9,20,null,null,15,7],
#     3
#    / \
#   9  20
#     /  \
#    15   7

# Return its bottom-up level order traversal as:
# [
#   [15,7],
#   [9,20],
#   [3]
# ]

class Node
    attr_accessor :val, :left, :right

    def initialize(val)
        @val = val
    end
end

# @param {TreeNode} root
# @return {Integer[][]}
# Time Complexity = O(n)
# Space Complexity = O(1)
def level_order_bottom(node)
    h = height(node)  # Get height
    res = []
    # While loop to traverse from last level to first.
    while h > 0
        @items = []        
        level_order_traversal(node,h,1)  # Find elements at each level.
        res << @items  # Insert each level elements to res array.
        h = h-1
    end
    return(res)  # Return result.
end

private

def level_order_traversal(node,level,curr_level)
    if node == nil || curr_level > level 
        return
    end
    if curr_level == level
        @items << node.val
    end
    level_order_traversal(node.left,level,curr_level+1)
    level_order_traversal(node.right,level,curr_level+1)
end

def height(node)
    if node == nil
        return 0
    end    
    lh = height(node.left)
    rh = height(node.right)
    if lh > rh
        return(lh+1)
    else
        return(rh+1)
    end   
end    

node = Node.new(3)
node.left = Node.new(9)
node.right = Node.new(20)
node.right.left = Node.new(15)
node.right.right = Node.new(7)
print level_order_bottom(node)

