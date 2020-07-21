# Remove Linked List Elements

# Remove all elements from a linked list of integers that have value val.

# Example:

# Input:  1->2->6->3->4->5->6, val = 6
# Output: 1->2->3->4->5

class Node
    attr_accessor :val, :next
    
    def initialize(val = 0)
        @val = val
    end
end


# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
    return if head == nil  # Return if head is nil
    # If head is equal to target val
    # Assign next element equal to head
    # Traverse till either head is equal to nil or its val is equal to target
    while head != nil && head.val == val do
        next_node = head.next
        head.next = nil
        head = next_node
    end    
    current = head  # Assign current equal to head
    # Traverse till current is not equal to nil
    while current != nil do
        # If next element is equal to target val, then remove it by assigning current.next to current.next.next
        # Else asign current equal to current.next
        if current.next != nil && current.next.val == val
            current.next = current.next.next
        else
            current = current.next
        end
    end
    return head  # Return head
end

def display(node)
    while node != nil do
        print node.val
        print ' '
        node = node.next
    end    
end    

node = Node.new(1)
node.next = Node.new(6)
node.next.next = Node.new(2)
node.next.next.next = Node.new(3)
node.next.next.next.next = Node.new(4)
node.next.next.next.next.next = Node.new(6)

res = remove_elements(node,1)
display(res)
