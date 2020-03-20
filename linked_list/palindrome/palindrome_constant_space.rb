class Node
	attr_accessor :val, :next

	def initialize(val)
		@val = val
	end	
end	

# Time Complexity O(n)
# Space Complexity O(1)
def is_palindrome?(head)
	return true if head == nil
	current = head
	val = palindrome_util(head,current)
	if val != nil
		return true
	else
		return false	
	end	
end	

private 

def palindrome_util(head,node)
	if node == nil
		return head
	end
	left = palindrome_util(head,node.next)
	if left != nil
		if left.val == node.val
			return (left.next ? left.next : left)
		else
			return nil
		end
	end		
end

head = Node.new(1)
head.next = Node.new(2)
head.next.next = Node.new(3)
head.next.next.next = Node.new(2)
head.next.next.next.next = Node.new(1)
puts is_palindrome?(head)