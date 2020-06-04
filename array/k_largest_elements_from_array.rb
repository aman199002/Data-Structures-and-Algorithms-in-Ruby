# Given an array of N positive integers, print k largest elements from the array.

# Example
# Input: [12,5,787,1,23,780,100] and k = 3
# Output: [787,780,100]

# Time Complexity = O(nlogk)
# Space Complexity = O(1)
def k_largest(a,k)
	return if a == nil || a.size == 0	
	min_heap = MinHeap.new()  # Initialize a min heap.
	count = 0
	result = []  # REsult array to store output.
	for i in 0..a.size-1 do
		# Insert element in min heap and increment count.
		min_heap.insert(a[i])
		count = count + 1
		# If count is greater than k, then pop element from heap and decrement count.
		# Note: to implement heap, we have taken first element in heap as nil.
		if count == k+1
			min_heap.pop
			count = count -1
		end
	end
	# When whole array is traversed, pop every element from heap and insert in result array.
	while !min_heap.empty? do
		poppped_item = min_heap.pop
		result << poppped_item
	end
	return result.reverse  # Return by reversing result array as elements are in ascending order.
end

# Min heap implementation
class MinHeap

	def initialize()
		@heap = [nil]
	end

	def insert(item)
		@heap << item
		bubble_up(@heap.size-1)
	end

	def pop
		swap(1,-1)
		poppped_item = @heap.pop
		bubble_down(1)
		poppped_item
	end

	def display
		print @heap
	end	

	def empty?
		@heap.size <= 1
	end	

	private

	def bubble_up(item_idx)
		return if item_idx == 1
		parent = item_idx/2
		if @heap[item_idx] < @heap[parent]
			swap(item_idx,parent)
			bubble_up(parent)
		end
	end

	def bubble_down(parent)
		left_child_idx = 2 * parent
		return if left_child_idx >= @heap.size
		right_child_idx = 2 * parent + 1
		smaller_child_idx = (@heap[right_child_idx] && @heap[right_child_idx] < @heap[left_child_idx]) ? right_child_idx : left_child_idx
		if @heap[smaller_child_idx] < @heap[parent]
			swap(smaller_child_idx,parent)
			bubble_down(smaller_child_idx)
		end
	end

	def swap(a,b)
		@heap[a], @heap[b] = @heap[b], @heap[a]
	end

end	

print k_largest([12,5,787,1,23,780,100],3)

