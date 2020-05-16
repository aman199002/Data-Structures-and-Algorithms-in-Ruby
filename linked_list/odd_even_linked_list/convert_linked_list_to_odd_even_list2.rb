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
	return head if head == nil || head.next == nil || head.next.next == nil
    node = head
    # Call utility function with odd, next_odd, even, next_even nodes.
	odd_even_list_util(node,node.next.next,node.next,node.next.next.next)
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

private

# 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7
# 1 -> 3 -> 2 -> 4 -> 5 -> 6 -> 7
# 1 -> 3 -> 5 -> 2 -> 4 -> 6 -> 7
# 1 -> 3 -> 5 -> 7 -> 2 -> 4 -> 6
# Store next to next odd node and next to next even node in variables.
# Find next of odd_node in some variable, i.e next_node.
# Connect odd_node to next_odd_node.
# Now connect next_odd_node to next_node which we had stored in var previously.
# Connect even_node to next_even_node.
# Now assign values to odd_node,next_odd_node,even_node,next_even_node and traverse again till last node.
def odd_even_list_util(odd_node,next_odd_node,even_node,next_even_node)
	while odd_node && next_odd_node do
		# puts "odd_node = #{odd_node.val}, next_odd_node = #{next_odd_node.val}, even_node=#{even_node&.val}, next_even_node=#{next_even_node&.val}"
		next_to_next_odd_node = next_odd_node.next ? next_odd_node.next.next : nil
		next_to_next_even_node = next_even_node && next_even_node.next ? next_even_node.next.next : nil
		next_node = odd_node.next
		odd_node.next = next_odd_node
		next_odd_node.next = next_node
		even_node.next = next_even_node
		odd_node = next_odd_node
		next_odd_node = next_to_next_odd_node
		even_node = next_even_node
		next_even_node = next_to_next_even_node
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

