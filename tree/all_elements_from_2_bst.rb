# All Elements in Two Binary Search Trees
# Given two binary search trees root1 and root2.
# Return a list containing all the integers from both trees sorted in ascending order.

# Example:

# Input: root1 = [2,1,4], root2 = [1,0,3]
# Output: [0,1,1,2,3,4]
# Example 2:

# Input: root1 = [0,-10,10], root2 = [5,1,7,0,2]
# Output: [-10,0,0,1,2,5,7,10]


class Node
    attr_accessor :val, :left, :right

    def initialize(val)
        @val = val
    end

end	

def get_all_elements(node1, node2)
    return [] if node1 == nil && node2 == nil
	a1 = []
	a2 = []
    inorder(node1,a1)
    inorder(node2,a2)
    merge(a1,a2)
end

private

def merge(a1,a2)
    return a1 if a2 == nil
	return a2 if a1 == nil
	res = Array.new(a1.size + a2.size)
	k = res.size-1
	i = a1.size-1
	j = a2.size-1
	while i >= 0 && j >= 0 do
		if a1[i] >= a2[j]
			res[k] = a1[i]
			i = i-1
		else
			res[k] = a2[j]
			j = j-1
		end
		k = k-1
	end
	while i >= 0 do
		res[k] = a1[i]
		i = i-1
		k = k-1
	end
	while j >= 0 do
		res[k] = a2[j]
		j = j-1
		k = k-1
	end
	return res
end	

def inorder(node,a)
	if node == nil
		return nil
	end	
	inorder(node.left,a)	
	a << node.val
	inorder(node.right,a)
	return node
end	

node1 = Node.new(2)
node1.left = Node.new(1)
node1.right = Node.new(4)

node2 = Node.new(1)
node2.left = Node.new(0)
node2.right = Node.new(3)

print get_all_elements(node1,node2)
