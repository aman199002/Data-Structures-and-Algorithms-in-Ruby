class ListNode
	attr_accessor :next,:val

	def initialize(val)
		@val = val
		@next = nil
	end
end

def reverse(node)
	# Node == nil is used in case linked list is empty
	if node == nil || node.next == nil
		@head = node
		return @head  # When linked list if of size 1, should return head.
	end
	reverse_list(node.next)
	node.next.next = node
	node.next = nil
	return @head
end

def display(node)
	while node != nil
		print node.val
		print ' '
		node = node.next
	end
end


head = ListNode.new(1)
node2 = head.next = ListNode.new(2)
node3 = head.next.next = ListNode.new(3)
node4 = head.next.next.next = ListNode.new(4)
node5 = head.next.next.next.next = ListNode.new(5)
display(head)
head = reverse(head)
puts 'List Reversed'
display(head)