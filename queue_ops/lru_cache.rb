class Lru

	# NOTE: Initialize and empty hash and array for cached queue
	def initialize(cache_size)
		@cache_size = cache_size
		@h1 = {}
		@cached_queue = Array.new
	end	

	# Method to add page
	def add_page(page)
		if @h1[page] # Check if page exists inside hash
			@cached_queue.delete(page) #TODO: Can be modified. Deleting specific page from queue if exists in hash.
			@cached_queue.unshift(page) # Insert the page in queue
			# puts "@cached_queue = #{@cached_queue}" #NOTE: To print cached queue data for each step. Commented
			return
		end
		@h1[page] = true # Set hash value if page does not exist inside hash
		if @cached_queue.size < @cache_size			
			@cached_queue.unshift(page)
		else
			popped_item = @cached_queue.pop # If cache queue is full. Pop from the queue.
			@cached_queue.unshift(page) # Insert given page in queue
			@h1[popped_item] = nil # Set hash value to nil for popped item
		end
		# puts "@cached_queue = #{@cached_queue}" #NOTE: To print cached queue data for each step. Commented
	end

	def get_cached_queue
		@cached_queue
	end	
end	

obj = Lru.new(3)
obj.add_page(1)
obj.add_page(2)
obj.add_page(3)
obj.add_page(4)
obj.add_page(1)
obj.add_page(2)
obj.add_page(5)
obj.add_page(1)
obj.add_page(2)
obj.add_page(3)
obj.add_page(4)
obj.add_page(5)
print obj.get_cached_queue
