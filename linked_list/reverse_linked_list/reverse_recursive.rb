# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def reverse_list(node,prev)
	current = node
	if current.next == nil
		head = current
		head.next = prev
		return head
	end
	next_node = current.next
	current.next = prev
	reverse_list(next_node,current)
end	

def display_list(head)
	current = head
	while current != nil do
		print current.val
		print ' '
		current = current.next
	end	
end

node = ListNode.new(1)
node.next = ListNode.new(2)
node.next.next = ListNode.new(3)
node.next.next.next = ListNode.new(4)
node.next.next.next.next = ListNode.new(5)
puts node.val
head = reverse_list(node,nil)
puts head.val
display_list(head)