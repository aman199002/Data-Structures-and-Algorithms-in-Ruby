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
# Space Complexity = O(k)
def reverse_in_chunks(node,k)
	s = [] # Initialize empty stack
	prev = nil	
	while node != nil do
		count = 0
		while node!=nil && count < k do # Push each node to stack till counter k.
			s.push(node)
			node = node.next
			count = count+1
		end
		while !s.empty? do    # Reverse list by popping each element from stack.
			if prev == nil
				prev = s[-1]
				s.pop
				head = prev
			else
				prev.next = s[-1]
				s.pop
				prev = prev.next
			end
		end
	end	
	prev.next = nil
	return head
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