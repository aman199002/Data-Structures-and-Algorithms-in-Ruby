# Odd Even Linked List
# Given a singly linked list, group all odd nodes together followed by the even nodes. 
# Please note here we are talking about the node number and not the value in the nodes.
# You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.

# Example:

# Input: 1->2->3->4->5->NULL
# Output: 1->3->5->2->4->NULL

# Input: 2->1->3->5->6->4->7->NULL
# Output: 2->3->6->7->1->5->4->NULL

class Node
	attr_accessor :next,:val

	def initialize(val)
		@val = val
	end

end	

# Time Complexity = O(n)
# Space Complexity = O(1)
def odd_even_list(head)
	return if head == nil
    odd = head
    even = odd.next
    even_head = even
    while even != nil && even.next != nil do
    	odd.next = even.next
    	odd = odd.next
    	even.next = odd.next
    	even = even.next
    end
    odd.next = even_head
    head
end

def display(head)
	node = head
	while node != nil do
		print node.val
		print ' '
		node = node.next
	end
end	

head = Node.new(1)
head.next = Node.new(2)
head.next.next = Node.new(3)
head.next.next.next = Node.new(4)
head.next.next.next.next = Node.new(5)
head.next.next.next.next.next = Node.new(6)
head.next.next.next.next.next.next = Node.new(7)
head.next.next.next.next.next.next.next = Node.new(8)
head.next.next.next.next.next.next.next.next = Node.new(9)
head.next.next.next.next.next.next.next.next.next = Node.new(10)
head = odd_even_list(head)
display(head)
