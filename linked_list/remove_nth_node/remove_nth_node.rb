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
    current = head
    counter = 1
    while current != nil do
    	# If counter is first node, then change head and return
    	if n == 1
    		temp = head
    		head = head.next
    		return head
    	end
    	# Check if counter is equal to next node, 
    	# then shift link of current to next to next node
    	# If node to be removed is last, then link it to nil
        if counter +1 == n
        	if current.next
        		current.next = current.next.next
        	else
        		current.next = nil
        	end	

        end    
        current = current.next
        counter = counter + 1
    end
    return head
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