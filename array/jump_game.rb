# @param {Integer[]} nums
# @return {Boolean}
def can_jump(a)
	if a == nil || a.size == 0
		return false
	end
	furthest_reach_so_far = 0
	for i in 0..a.size-1 do
		if i > furthest_reach_so_far || furthest_reach_so_far >= a.size-1
			break
		end	
		furthest_reach_so_far = [furthest_reach_so_far, i + a[i]].max
	end	
	return furthest_reach_so_far >= a.size-1
end

puts can_jump([2,3,1,1,4])
puts can_jump([3,2,1,0,4])
puts can_jump([1])
puts can_jump([2,0])