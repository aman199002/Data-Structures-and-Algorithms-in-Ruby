# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
	current = head
	prev = nil
	next_node = nil	
	while current != nil do
		next_node = current.next
		current.next = prev
		# puts "current.next.val = #{current.next&.val}"
		prev = current
		current = next_node
	end
	prev
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
head = reverse_list(node)
puts head.val
display_list(head)