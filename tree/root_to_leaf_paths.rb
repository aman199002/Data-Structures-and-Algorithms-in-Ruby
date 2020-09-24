class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end	
end

def get_path(node)
	path = []
	print_paths(node,path)
end

def print_paths(node,path)	
	if node == nil
		return
	end
	path << node.val
	print_paths(node.left,path)
	print_paths(node.right,path)
	if node.left == nil && node.right == nil
		puts "path = #{path}"
	end	
	path.pop
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
get_path(root)