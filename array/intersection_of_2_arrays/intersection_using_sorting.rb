# @param {Integer[]} a1
# @param {Integer[]} a2
# @return {Integer[]}
def find_intersection(a1,a2)
	intersection = []
    a1 = a1.sort
	a2 = a2.sort
	i = 0
	j = 0
	m = a1.size
	n = a2.size
	while i < m && j < n do
		if a1[i] > a2[j]
			j = j+1
		elsif a1[i] < a2[j]
			i = i+1
		else
            intersection << a1[i]
			# print a1[i]
			# print ' '
			i = i+1
			j = j+1
		end
	end
    intersection
end

print find_intersection([4,9,5],[9,4,9,8,4])
puts
print find_intersection([1,2,2,1],[2,2])
puts
print find_intersection([1],[2])