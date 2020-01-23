class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end

# Complexity: O(n)
def generate_bst(a,start,last)
	if start > last
		return nil
	end
	mid = (start + last)/2
	node = Node.new(a[mid])
	node.left = generate_bst(a,start,mid-1)
	node.right = generate_bst(a,mid+1,last)
	node
end

def display(node)
	q = [node]
	while !q.empty? do
		popped_item = q.pop
		print popped_item.val
		print ' '
		if popped_item.left != nil
			q.unshift(popped_item.left)
		end	
		if popped_item.right != nil
			q.unshift(popped_item.right)
		end
	end	
end	

# a = [0,1,2,3,4,5]
a = [-10,-3,0,5,9]
node = generate_bst(a,0,a.size-1)
display(node)