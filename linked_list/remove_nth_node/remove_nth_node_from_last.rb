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
  start = 1
  counter = 1
  current = head
  while current != nil do
  	if counter > n 
  		start = start + 1
  		# puts "counter = #{counter}"
  		# puts "start = #{start}"
  	end
  	counter = counter + 1
  	current = current.next
  end
  puts "start = #{start}"
  counter = 1
  current = head
  while current != nil do
  	if start == 1
  		head = current.next
  		current.next = nil
  		return head
  	end	
  	if counter +1 == start
  		if current.next.next
  			current.next = current.next.next
  		else
			current.next = nil
  		end	
  	end
  	counter = counter + 1
  	current =  current.next 
  end
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
head = remove_nth_from_end(head, 3)
display_list(head)