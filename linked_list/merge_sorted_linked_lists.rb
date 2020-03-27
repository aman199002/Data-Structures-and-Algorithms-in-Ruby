class Node
	attr_accessor :val,:next

	def initialize(val)
		@val = val
	end	
end	

def merge(node1,node2)
	if node1 == nil && node2 == nil
		return nil
	elsif node1 != nil && node2 == nil
		return node1
	elsif node1 == nil && node2 != nil
		return node2
	end	
	if node1.val > node2.val
		node1,node2 = node2,node1 
	end	
	head = node1
	while(node2 != nil) do		
		if node1.val == node2.val
			next_node1 = node1.next
			next_node2 = node2.next
			node1.next = node2
			node2.next = next_node1
			node1 = node1.next
			node2 = next_node2
		elsif node2.val > node1.val
			if node1.next && node2.val > node1.next.val
				node1 = node1.next
			else
				next_node1 = node1.next
				next_node2 = node2.next
				node1.next = node2
				node2.next = next_node1
				node1 = node1.next
				node2 = next_node2
			end	
		end
	end
	head
end

def print_list(node)
	if node == nil
		return
	end
	print node.val
	print ' '
	print_list(node.next)
end	

head1 = Node.new(1)
head1.next = Node.new(2)
head1.next.next = Node.new(5)
head1.next.next.next = Node.new(6)

head2 = Node.new(1)
head2.next = Node.new(1)
head2.next.next = Node.new(2)
head2.next.next.next = Node.new(4)

head = merge(head1,head2)
puts 'After merging'
print_list(head)
