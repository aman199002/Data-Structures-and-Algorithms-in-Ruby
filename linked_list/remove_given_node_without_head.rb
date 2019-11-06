# Definition for singly-linked list.
class ListNode
	attr_accessor :next, :val

	def initialize(val)
		@val = val
		@next = nil
	end

end	

# @param {ListNode} node
# @return {Void} Do not return anything, modify node in-place instead.
def delete_node(node)
    node.val = node.next.val
    node.next = node.next.next
end

def display_list(head)
	current = head
	while current != nil
		print current.val
		print ' '
		current = current.next
	end
	puts '' # For newline
end	

head = ListNode.new(1)
node2 = head.next = ListNode.new(2)
node3 = head.next.next = ListNode.new(3)
node4 = head.next.next.next = ListNode.new(4)
node5 = head.next.next.next.next = ListNode.new(5)
delete_node(node3)
display_list(head)
delete_node(node3)
display_list(head)