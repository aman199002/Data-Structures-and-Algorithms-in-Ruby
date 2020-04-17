class PriorityQueue

	def initialize
		@heap = [nil]
	end

	def insert(num)
		@heap << num
		bubble_up(last_index)
		# puts "@heap = #{@heap}"
		self		
	end
	
	def pop		
		min = @heap[1]
		swap(1,last_index)
		@heap.pop
		bubble_down(1)
		# puts "@heap = #{@heap}"
		min		
	end

	def get_min
		@heap[1]
	end	

	private

	def last_index
		@heap.size - 1
	end

	def bubble_up(index)
		parent = index/2
		return if parent == 0
		if @heap[parent] > @heap[index]
			swap(parent,index)
			bubble_up(parent)
		end	
	end

	def bubble_down(index)
		left_child = 2 * index
		right_child = 2 * index + 1
		return if left_child > last_index # When left_child is greater than last index, all elements are traversed. Hence, return.
		lesser_child_index = find_smaller_element(left_child,right_child)
		if @heap[lesser_child_index] < @heap[index]
			swap(lesser_child_index,index)
			bubble_down(lesser_child_index)
		end	
	end	

	def swap(a,b)
		temp = @heap[a]
		@heap[a] = @heap[b]
		@heap[b] = temp
	end

	def find_smaller_element(a,b)
		return a if b > last_index # When b is greater than last index, means its invalid. So, return.
		@heap[a] < @heap[b] ? a : b
	end	

	
end

pq = PriorityQueue.new
pq.insert(5)
pq.insert(4)
puts pq.get_min
pq.insert(1)
pq.insert(7)
pq.insert(9)
pq.insert(3)
puts pq.get_min
pq.insert(6)
pq.insert(8)
puts pq.get_min
pq.pop
puts pq.get_min
pq.pop
pq.pop
pq.pop
pq.pop
puts pq.get_min