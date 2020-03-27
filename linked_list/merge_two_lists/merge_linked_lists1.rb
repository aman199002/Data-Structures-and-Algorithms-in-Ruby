# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
	while l1.next != nil do
		temp_node_l2 = l2.next
		temp_node_l1 = l1.next
		l2.next = nil
		l1.next = l2
		l1.next.next = temp_node_l1
		l1 = temp_node_l1
		l2 = temp_node_l2
	end
	l1.next = l2
end

def display_list(head)
	current = head
	while current != nil do
		print current.val
		print ' '
		current = current.next
	end	
end

l1 = ListNode.new(1)
l1.next = ListNode.new(1)
l1.next.next = ListNode.new(1)

l2 = ListNode.new(1)
l2.next = ListNode.new(3)
l2.next.next = ListNode.new(5)

# display_list(l2)

merge_two_lists(l1, l2)

display_list(l1)