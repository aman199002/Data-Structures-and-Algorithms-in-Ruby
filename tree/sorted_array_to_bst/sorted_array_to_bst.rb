class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end

def generate_bst(a)
	return nil if a.empty?
	node = Node.new(a[0])
	for i in 1..a.size-1 do
		insert_node(a[i],node)
		lh = height(node.left)
		rh = height(node.right)
		if (lh - rh).abs > 1
			node = restructure(node,lh,rh)
		end	
	end
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

private

def restructure(node,lh,rh)
	if rh > lh
		temp = node.right
		node.right = nil
		temp.left = node		
	else
		temp = node.left
		node.left = nil
		temp.right = node	
	end	
	return temp
end	

def height(node)
	if node == nil
		return 0
	end	
	lh = height(node.left)
	rh = height(node.right)
	if lh >= rh
		return(lh+1)
	else
		return(rh+1)
	end	
end	

def insert_node(val,node)
	if val >= node.val
		while val >= node.val && node.right != nil do
			node = node.right
		end
		node.right = Node.new(val)
	else
		while val < node.val && node.left != nil do
			node = node.left
		end
		node.left = Node.new(val)
	end	
end	

node = generate_bst([-10,-3,0,5,9])
# node = generate_bst([0,1,2,3,4,5])
display(node)