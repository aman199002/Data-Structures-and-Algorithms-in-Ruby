class Node
	attr_accessor :next, :val

	def initialize(val)
		@val = val
	end

end

# Time Complexity = O(n)
# Space Complexity = O(n)
def detect_and_break_loop(node)
	return false if node == nil
	head = node
	slow = node  # Take a slow pointer starting at initial node.
	fast = node  # Take a fast pointer starting at initial node.
	loop = false
	while slow.next != nil && fast.next.next != nil do
		slow = slow.next  # Move slow pointer by one point.
		fast = fast.next.next  # Move slow pointer by 2 points.
		# In ideal case when there is no loop, these 2 pointers will never meet.
		# If they meet, means there is some cycle. Break the loop in this condition.
		if slow == fast
			break_loop(head)
		end
	end
	return head
end

def display(node)
	while node != nil do
		print node.val
		print ' '
		node = node.next
	end	
end	

private

def break_loop(node)
	h1 = {}  # Initialie a hash
	# For each iteration, store next_node as key and node pointing to it as value.
	# If we find another node which is pointing to node which is already stored in hash.
	# It means that node is being pointed by 2 nodes.
	# Now break the second point by setting node next equal to nil.
	while node != nil && node.next != nil do
		if h1[node.next]
			node.next = nil
		end
		h1[node.next] = node
		node = node.next
	end
end

node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)
node5 = Node.new(5)
node6 = Node.new(6)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
node6.next = node3
detect_and_break_loop(node1)
display(node1)

