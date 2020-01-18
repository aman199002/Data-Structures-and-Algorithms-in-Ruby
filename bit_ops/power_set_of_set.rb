# Write a function that, given a set, generates its power set.
# The power set of a set is the set of all its subsets.
# For example, given the set {1, 2, 3}, it should return {{}, {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3}}.

def power_set(set,set_size)
	pow_set_size = 2 ** set_size
	subsets = []
	for counter in 0..pow_set_size-1 do
		subset = []
		for j in 0..set_size do
		  if((counter & (1 << j)) > 0)
		  	subset << set[j]
		  end	
		end
		subsets << subset
	end
	subsets
end

set = ['a', 'b', 'x']; 
print power_set(set,3)