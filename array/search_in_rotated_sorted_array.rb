# Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
# (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
# You are given a target value to search. If found in the array return its index, otherwise return -1.
# You may assume no duplicate exists in the array.
# Your algorithm's runtime complexity must be in the order of O(log n).

# Example:
# Input: nums = [4,5,6,7,0,1,2], target = 0
# Output: 4

# Input: nums = [4,5,6,7,0,1,2], target = 3
# Output: -1

# Time Complexity = O(n)
# First find a pivot to divide array into 2 subarrays
# Now call binary search on one of the subarray
# If target element is greater than 0th element then search in left subarray
# Else search in right subarray
def search(a,val)
	pivot = find_pivot(a,0,a.size-1)
	if pivot == -1
		return -1
	elsif a[pivot] == val
		return pivot
	end
	if a[0] <= val
		return binary(a,0,pivot-1,val)
	else
		return binary(a,pivot+1,a.size-1,val)
	end
end

private

# Binary search function
def binary(a,start,last,val)
	if start > last
		return -1
	end
	mid = start+(last-start)/2
	if a[mid] == val
		return mid
	elsif a[mid] > val
		binary(a,start,mid-1,val)
	else
		binary(a,mid+1,last,val)
	end
end

# Find mid index from the array
# If element next to mid is smaller than itself, return mid
# If element before mid is larger than mid, return mid-1
# Recursively call this function
def find_pivot(a,low,high)
	if low > high
		return
	end
	if low == high
		return low
	end
	mid = low+(high-low)/2
	if mid < high && a[mid] > a[mid+1]
		return mid
	elsif mid < low && a[mid] < a[mid-1]
		return mid-1
	end
	if a[low] > a[mid]
		find_pivot(a,low,mid-1)
	else
		find_pivot(a,mid+1,high)
	end
end

puts search([4,5,6,7,0],0)
puts search([1,3],1)