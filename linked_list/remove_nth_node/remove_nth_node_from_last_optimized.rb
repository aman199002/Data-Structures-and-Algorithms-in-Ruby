# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  first = head
  second = head
  for i in 0..n-1 do
  	 if second.next == nil
  	 	head = head.next
  	 	return head
  	 end	
  	 second =  second.next
  end
  puts "second.val = #{second.val}"
  while second.next != nil do
  	first = first.next
  	second = second.next
  end
  first.next = first.next.next
  head
end

def display_list(head)
	current = head
	while current != nil do
		print current.val
		print ' '
		current = current.next
	end	
end

head = ListNode.new(1)
head.next = ListNode.new(2)
head.next.next = ListNode.new(3)
head.next.next.next = ListNode.new(4)
head.next.next.next.next = ListNode.new(5)
head = remove_nth_from_end(head, 2)
display_list(head)