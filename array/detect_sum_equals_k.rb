# Find if sum any 2 numbers from array equals to k in single pass.
# Time Complexity O(n).
# Space Complexity O(n).
def detect_sum_equals_k(a,k)
	h1 = {}
	for i in 0..a.size-1 do		
		if h1[a[i]]
			return true
		else
			h1[k-a[i]] = a[i]
		end
	end
	return false
end

print detect_sum_equals_k([10, 15, 3, 7],18)