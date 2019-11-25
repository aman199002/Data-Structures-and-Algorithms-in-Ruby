class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end

def construct(in_o,post_o,start,last)
	if start > last
		return
	end	
	t_node = Node.new(post_o[@post_idx])
	@post_idx = @post_idx-1
	if start == last
		return t_node
	end
	puts "last=#{last},t_node.val=#{t_node.val}"
	in_idx = search(in_o,last,t_node.val)
	t_node.right = construct(in_o,post_o,in_idx+1,last)
	t_node.left = construct(in_o,post_o,start,in_idx-1)
	return t_node
end

def search(in_o,last,element)
	for i in 0..last do
		if in_o[i] == element
			return i
		end	
	end	
end

inorder = [4,8,2,5,1,6,3,7]
postorder = [8,4,5,2,6,7,3,1]
@post_idx = inorder.size-1
root = construct(inorder,postorder,0,inorder.size-1)
puts root.val
puts root.left.val
puts root.right.val
puts root.left.left.val
puts root.left.right.val
puts root.right.left.val
puts root.right.right.val
puts root.left.left.right.val