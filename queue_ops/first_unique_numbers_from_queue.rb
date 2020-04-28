# First Unique Number

# You have a queue of integers, you need to retrieve the first unique integer in the queue.
# Implement the FirstUnique class:
# FirstUnique(int[] nums) Initializes the object with the numbers in the queue.
# int showFirstUnique() returns the value of the first unique integer of the queue, and returns -1 if there is no such integer.
# void add(int value) insert value to the queue.

# Example:

# Input: 
# ["FirstUnique","showFirstUnique","add","showFirstUnique","add","showFirstUnique","add","showFirstUnique"]
# [[[2,3,5]],[],[5],[],[2],[],[3],[]]
# Output: 
# [null,2,null,2,null,3,null,-1]

# Input: 
# ["FirstUnique","showFirstUnique","add","add","add","add","add","showFirstUnique"]
# [[[7,7,7,7,7,7]],[],[7],[3],[3],[7],[17],[]]
# Output: 
# [null,-1,null,null,null,null,null,17]

class FirstUnique

=begin
    :type nums: Integer[]
=end
# Initialize empty hash
# Store key as element and value as count while adding elements to queue
    def initialize(nums)
        @q = []
        @h1 = {}
        for i in 0..nums.size-1 do
            @q.unshift(nums[i])
            if @h1[nums[i]]
                @h1[nums[i]] = @h1[nums[i]] + 1
            else
                @h1[nums[i]] = 1
            end    
        end    
    end


=begin
    :rtype: Integer
=end
# Time Complexity = O(n)
# Space Complexity = O(n)
    def show_first_unique()
        # Iterate hash and return where value is equal to 1
        @h1.each do |k,v|
            if v == 1
                return k
            end    
        end
        return -1  # Return -1 if no value with count 1.
    end


=begin
    :type value: Integer
    :rtype: Void
=end
# Update hash with element count while adding element to queue
    def add(value)
        @q.unshift(value)
        if @h1[value]
            @h1[value] = @h1[value] + 1
        else
            @h1[value] = 1
        end    
    end


end

obj = FirstUnique.new([2,3,5])
puts obj.show_first_unique()
obj.add(5)
puts obj.show_first_unique()
obj.add(2)
puts obj.show_first_unique()
obj.add(3)
puts obj.show_first_unique()

obj = FirstUnique.new([7,7,7,7,7,7])
puts obj.show_first_unique()
obj.add(7)
obj.add(3)
obj.add(3)
obj.add(7)
obj.add(17)
puts obj.show_first_unique()
