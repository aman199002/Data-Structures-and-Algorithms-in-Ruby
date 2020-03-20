# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# # @param {ListNode} head
# # @return {Boolean}
# def is_palindrome(p1,p2)
# 	p2 = p2.next
# 	if p2 == nil
# 		return p1
# 	end	
# 	puts "p1.val = #{p1.val}"
# 	puts "p1.val = #{p1.val}"
# 	p1 = is_palindrome(p1,p2)
# 	# puts "p2.val = #{p2.val}"
	
# 	# if p1 != p2
# 	# 	return false
# 	# end
# 	p1 = p1.next	
# end

# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
	current = head
	stack = []
	while current != nil do
		stack.push(current.val)
		current = current.next
	end
	current = head
	while current != nil do
		if current.val != stack.pop
			return false
		end	
		current = current.next
	end
	return true
end

head = ListNode.new(1)
node2 = head.next = ListNode.new(2)
node3 = head.next.next = ListNode.new(3)
node4 = head.next.next.next = ListNode.new(2)
node5 = head.next.next.next.next = ListNode.new(1)
puts is_palindrome(head)