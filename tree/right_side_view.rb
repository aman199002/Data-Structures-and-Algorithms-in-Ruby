# Binary Tree Right Side View

# Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

# Example:

# Input: [1,2,3,null,5,null,4], Output: [1, 3, 4]

# Explanation:

#    1            <---
#  /   \
# 2     3         <---
#  \     \
#   5     4       <---

class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end

end	

def right_side_view(node)
    return [] if node == nil
    q = [node]
    res = []
    while !q.empty? do
        size = q.size  # Current size of the queue to iterate elements at each level
        i = 0  # Counter to keep track of first element at each level
        while size != 0 do
            popped_item = q.pop
            # Always insert first eleemnt at each level in res array
            if i == 0
                res << popped_item.val
            end
            # Insert right element first and then left
            if popped_item.right
                q.unshift(popped_item.right)
            end
            if popped_item.left
                q.unshift(popped_item.left)
            end
            size = size-1
            i = i+1
        end
    end
    return res
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
root.right.right.right = Node.new(8)
print right_side_view(root)
