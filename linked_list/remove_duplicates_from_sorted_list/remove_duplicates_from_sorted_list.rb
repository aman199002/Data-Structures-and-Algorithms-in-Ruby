# Remove Duplicates from Sorted List II
# Given the head of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list. Return the linked list sorted as well.

# Example:

# Input: head = [1,2,3,3,4,4,5]
# Output: [1,2,5]

# Input: head = [1,1,1,2,3]
# Output: [2,3]

# Input: head = [1,1,1,2,]
# Output: [2]

# Input: head = [1,1,1,1]
# Output: []

# Definition for singly-linked list.

class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

# @param {ListNode} head
# @return {ListNode}
# Time Complexity = O(n)
# Space Complexity = O(n)
def delete_duplicates(node)
    return if node == nil
    head = node
    h1 = {}
    # Traverse linked list and store all duplicates in a hash
    while node.next != nil do
        if node.val == node.next.val
            h1[node.val] = true
        end
        node = node.next
    end
    node = head
    temp = ListNode.new(0,head)  # Add temp node at the beginning to handle the case when head has to be removed
    prev = temp  # Assign prev equal to temp node
    while node != nil do
    	# If node found as duplicate, skip
    	# Else, move prev to current node
        if h1[node.val]
            prev.next = node.next
        else
            prev = node
        end
        node = node.next
    end
    return temp.next  # Return next of temp node
end

def display(node)
	while node != nil do
		print node.val
		print ' '
		node = node.next
	end	
end	


node = ListNode.new(1)
node.next = ListNode.new(2)
node.next = ListNode.new(3)
node.next.next = ListNode.new(3)
node.next.next.next = ListNode.new(4)
node.next.next.next.next = ListNode.new(4)
node.next.next.next.next.next = ListNode.new(5)

res_node = delete_duplicates(node)

display(res_node)



