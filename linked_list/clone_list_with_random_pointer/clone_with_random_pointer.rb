# Clone a linked list with next and random pointer in O(1) space
# Given a linked list having two pointers in each node. 
# The first one points to the next node of the list, however the other pointer is random and can point to any node of the list. 
# Write a program that clones the given list in O(1) space, i.e., without any extra space.

# Time complexity O(n)
# space Complexity O(1)
class Node
	attr_accessor :next,:val,:random

	def initialize(val)
		@val = val
	end	
end

def clone(node)
	head = node
	while node != nil do
		temp = node.next
		node.next = Node.new(node.val)
		node.next.next = temp
		node = temp
	end
	node = head
	while node != nil do
		if node.random
			node.next.random = node.random.next
		end
		node = node.next.next
	end	
	orig = head
	copy = head.next
	temp = copy
	while orig != nil && copy != nil do
		if orig.next
			orig.next = orig.next.next
		end
		if copy.next
			copy.next = copy.next.next
		end	
		orig = orig.next
		copy = copy.next
	end	
	return temp
end


private

def print_list(node)
	if node == nil
		return nil
	end
	print node.val
	print ' '
	if node.random
		print "random = #{node.random.val}"
	end
	puts
	print_list(node.next)
end


head = Node.new(1)
node2= Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)
node5 = Node.new(5)

head.next = node2
head.random = node3
node2.next = node3
node3.next = node4
node3.random = node5
node4.next = node5
node4.random = node5
node5.random = node2

print_list(head)
_head = clone(head)
puts 'After clone'
print_list(_head)
