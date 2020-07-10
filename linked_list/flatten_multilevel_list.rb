# Flatten a Multilevel Doubly Linked List: Leetcode-430

# You are given a doubly linked list which in addition to the next and previous pointers, it could have a child pointer, which may or may not point to a separate doubly linked list.
# These child lists may have one or more children of their own, and so on, to produce a multilevel data structure, as shown in the example below.
# Flatten the list so that all the nodes appear in a single-level, doubly linked list. You are given the head of the first level of the list.

# Example

# 1---2---3---4---5---6--NULL
#          |
#          7---8---9---10--NULL
#              |
#              11--12--NULL

# Output: [1,2,3,7,8,11,12,9,10,4,5,6]
 

# Definition for a Node.
class Node
    attr_accessor :val, :prev, :next, :child
    def initialize(val=nil, prev=nil, next_=nil, child=nil)
        @val = val
        @prev = prev
        @next = next_
        @child = child
    end
end

# @param {Node} root
# @return {Node}
def flatten(node)
    head = node
    st = []  # Initialize stack in form of array
    # Traverse while node is not equal to nil
    while node != nil do
        # If node child is not nil,
        # Then push next node to stack if next node is mot nil.
        # Set child node to next node
        # Then set child equal to nil
        # As its a doubly linked list, set next node previous equal to node itself
        if node.child != nil
            if node.next != nil
                st.push(node.next)
            end    
            node.next = node.child
            node.child = nil
            node.next.prev = node
        # If next node is nil, means pointer has been reached to the last node.
        # Now pop each item from stack and assign it as next for the current node.
        # Set previous for next node equal to node itself as its doubly lnked list.
        elsif node.next == nil && !st.empty?
            node.next = st.pop
            node.next.prev = node
        end
        # Assign next node equal to node.
        node = node.next
    end
    return head  # Return head
end

# Method to print nodes of single linked list.
def display(node)
    while node != nil do
        print node.val
        print ' '
        node = node.next
    end    
end    

node = Node.new(1)
node.next = Node.new(2)
node.next.next = Node.new(3)
node.next.next.next = Node.new(4)
node.next.next.next.next = Node.new(5)
node.next.next.next.next.next = Node.new(6)

node.next.next.child = Node.new(7)
node.next.next.child.next = Node.new(8)
node.next.next.child.next.next = Node.new(9)
node.next.next.child.next.next.next = Node.new(10)

node.next.next.child.next.child = Node.new(11)
node.next.next.child.next.child.next = Node.new(12)

res_node = flatten(node)
display(res_node)

