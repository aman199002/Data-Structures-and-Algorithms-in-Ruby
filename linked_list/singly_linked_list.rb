class Node
	attr_accessor :value, :next

	def initialize(value=nil)
		@value = value
	end	
end	

class LinkedList
	attr_accessor :head

	# Initialize first node as head if value is provided
	def initialize(value=nil)
		@head = Node.new(value) if value
	end

	# If head is nil, create a new node and assign to head
	# Else loop until node next pointer is not null and add at last
	def insert(value)
		if @head == nil
			@head = Node.new(value)
		else
			current_node = @head
			while current_node.next do
				current_node = current_node.next
			end
			current_node.next = Node.new(value)
		end	
	end

	# Shift head to next if head is the element to be deleted
	# Else traverse and link next pointer of node to next next node if found
	# If value is not present in any node, return 0
	def remove(value)
		if @head.value == value
			@head = @head.next
			return true
		else
			current_node = @head
			while current_node.next != nil do
				if current_node.next.value == value
					current_node.next = current_node.next.next
					return true
				end
				current_node = current_node.next
			end	
		end
		return nil # Return nil in case element is not present in linked list
	end	

	# Traverse list and compare value of each node
	# Return node if value matched at some node otherwise false
	def find(value)
		current_node = @head
		while current_node do
			if current_node.value == value
				return current_node
			end	
			current_node = current_node.next
		end	
		return false
	end		

	# Traverse the list and insert each node to array, then return the array
	def return_list
		arr = []
		current_node = @head
		while current_node do
			arr << current_node
			current_node = current_node.next
		end	
		arr
	end	

	# Traverse the list and insert value from each node to array, then return the array
	def display
		arr = []
		current_node = @head
		while current_node do
			arr << current_node.value
			current_node = current_node.next
		end	
		arr	
	end	

end	

list = LinkedList.new()
list.insert(1)
list.insert(2)
list.insert(3)
list.insert(4)
list.insert(5)
list.remove(2)
puts list.display
# puts list.find(1)
puts list.return_list