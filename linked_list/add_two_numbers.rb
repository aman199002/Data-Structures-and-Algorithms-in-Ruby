# Add Two Numbers

# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

# Example:
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

class Node
	attr_accessor :next, :val

	def initialize(val)
		@val = val
	end	
end	

# Time Complexity = O(n)
# Space Complexity = O(1)
def add_two_numbers(node1,node2)
	return [] if node1 == nil && node2 == nil  # Return if given lists are nil
	num1 = get_num(node1)  # Get number1
	num2 = get_num(node2)  # Get number2
	sum = num1 + num2	# Add 2 numbers
	# Convert number to linked list by getting divisible and modulus.
	div = sum/10
	mod = sum%10
	head = Node.new(mod)
	current = node
	# convert_to_list(node,div)   # Use this method when using recursion to create linked list.
	while true do
		mod = div%10
		div = div/10
		break if div == 0 && mod == 0  # Break when both div and mod are 0.
		current.next = Node.new(mod)
		current = current.next
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

def get_num(node)
	if node == nil
		return 0
	end
	n = get_num(node.next)
	return(n*10 + node.val)
end	

# Convert to list using recursion
def convert_to_list(node,div)
	mod = div%10
	div = div/10
	if div == 0 && mod == 0
		return nil
	end
	node.next = Node.new(mod)
	convert_to_list(node.next,div)
end

node1 = Node.new(2)
node1.next = Node.new(4)
node1.next.next = Node.new(3)
node2 = Node.new(5)
node2.next = Node.new(6)
node2.next.next = Node.new(4)

node = add_two_numbers(node1,node2)
display(node)

