class ListNode
	attr_accessor :next, :val

	def initialize(val)
		@val = val
		@next = nil
	end	

end	

def detect_and_break(head)
	current = head
	first = head
	second = head
	while second != nil && second.next != nil
		first = first.next
		second = second.next.next
		if first == second
			break_loop(head,first)
			return head
		end	
	end
	return false
end

def break_loop(head,loop_node)
	ptr1 = head
	
	while(true) do
		ptr2 = loop_node
		while(ptr2.next != loop_node && ptr2.next != ptr1) do
			ptr2 = ptr2.next
		end
		if ptr2.next == ptr1			
			ptr2.next = nil
			return
		end
		ptr1 = ptr1.next
	end		
end	

def display_list(head)
	current = head
	counter = 1
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
node6 = head.next.next.next.next.next = ListNode.new(6)
node6.next = node3
# display_list(head)  # Print endless linked list cycle
detect_and_break(head)
display_list(head)