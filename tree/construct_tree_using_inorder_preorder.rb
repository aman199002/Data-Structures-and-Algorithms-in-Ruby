class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end

@pre_idx = 0
def construct(in_o,pre_o,start,last)	
	if start > last
		return
	end	
	t_node = Node.new(pre_o[@pre_idx])	
	@pre_idx = @pre_idx + 1
	if start == last
		return t_node
	end
	in_idx = search(in_o,last,t_node.val)
	t_node.left = construct(in_o,pre_o,start,in_idx-1)
	t_node.right = construct(in_o,pre_o,in_idx+1,last)
	return t_node
end

def search(in_o,last,element)
	for i in 0..last do
		if in_o[i] == element
			return i
		end	
	end	
end

preorder = ['A','B','D','E','C','F']
inorder = ['D','B','E','A','F','C']

root = construct(inorder,preorder,0,inorder.size-1)
puts root.val
puts root.left.val
puts root.right.val
puts root.left.left.val
puts root.left.right.val
puts root.right.left.val