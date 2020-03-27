class Node
	attr_accessor :next,:val

	def initialize(val)
		@val = val
	end	

end	

def merge(node1,node2)
	head = node1
	return if node1 == nil || node2 == nil
	while node1 != nil && node2 != nil do
		tmp1 = node1.next
		tmp2 = node2.next
		if node1 != nil
			node1.next = node2
		end	
		node2.next = tmp1
		node1 = tmp1
		node2 = tmp2
	end
	head
end

def display(node)
	if node == nil
		return
	end	
	print node.val
	print ' '
	display(node.next)
end	

node1 = Node.new(1)
node1.next = Node.new(2)
node1.next.next = Node.new(3)
node1.next.next.next = Node.new(4)
# node1.next.next.next.next = Node.new(5)

node2 = Node.new(6)
node2.next = Node.new(7)
node2.next.next = Node.new(8)
node2.next.next.next = Node.new(9)
node2.next.next.next = Node.new(10)

node = merge(node1,node2)
display(node)
