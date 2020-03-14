#  Reverse a Linked List in groups of given size
# Input: 1->2->3->4->5->6->7->8->NULL, K = 3
# Output: 3->2->1->6->5->4->8->7->NULL

class Node
	attr_accessor :next,:val

	def initialize(val)
		@val = val
	end	
end

# Time Complexity = O(n)
# Space Complexity = O(1)
def reverse_in_chunks(node,k)
	current = node
	next_node = nil
	prev = nil
	count = 0
	while count < k && current != nil do
		next_node = current.next
		current.next = prev
		prev = current
		current = next_node
		count = count+1
	end
	if next_node != nil
		node.next = reverse_in_chunks(next_node,k)
	end
	return prev
end

def print_list(node)
	if node == nil
		return
	end
	print node.val
	print ' '
	print_list(node.next)
end	

node = Node.new(1)
node.next = Node.new(2)
node.next.next = Node.new(3)
node.next.next.next = Node.new(4)
node.next.next.next.next = Node.new(5)
node.next.next.next.next.next = Node.new(6)

print_list(node)
puts
head = reverse_in_chunks(node,2)
print_list(head)