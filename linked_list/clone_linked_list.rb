class Node
	attr_accessor :next,:val,:random

	def initialize(val)
		@val = val
	end	
end

def clone(node)
	_node = Node.new(node.val)
	clone_list(node,_node)
end

def clone_list(node,_node)
	if node == nil
		return
	end
	if node.next
		_node.next = Node.new(node.next.val)
	end
	clone_list(node.next,_node.next)
	return _node
end

private

def print_list(node)
	if node == nil
		return nil
	end
	print node.val
	print ' '
	print_list(node.next)
end


head = Node.new(1)
head.next= Node.new(2)
head.next.next = Node.new(3)
head.next.next.next = Node.new(4)
head.next.next.next.next = Node.new(5)
print_list(head)
_head = clone(head)
puts 'After clone'
print_list(_head)