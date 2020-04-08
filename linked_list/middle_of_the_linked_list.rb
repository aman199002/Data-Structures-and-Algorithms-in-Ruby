# Given a non-empty, singly linked list with head node head, return a middle node of linked list.
# If there are two middle nodes, return the second middle node.

# Example
# Input: [1,2,3,4,5]
# Output: Node 3 from this list (Serialization: [3,4,5])

# Input: [1,2,3,4,5,6]
# Output: Node 4 from this list (Serialization: [4,5,6])

class Node
	attr_accessor :next, :val

	def initialize(val)
		@val = val
	end

end

# Time Complexity = O(n)
# Space Complexity = O(1)
def middle_node(node)
	length = get_length(node,0)
	mid = (length%2 == 0 ? (length/2-1) : length/2)
	@middle = nil
	get_mid(node,mid)
	@middle
end

private

def get_mid(node,mid)
	if node == nil
		return 0
	end
	count = get_mid(node.next,mid)
	if count == mid
		@middle = node
	end	
	count = count+1
	count
end

def get_length(node,count)
	if node == nil
		return 0
	end
	count = get_length(node.next,count)
	count = count + 1
	count
end

node = Node.new(1)
node.next = Node.new(2)
node.next.next = Node.new(3)
node.next.next.next = Node.new(4)
node.next.next.next.next = Node.new(5)
node.next.next.next.next.next = Node.new(6)
head = middle_node(node)
puts head.val