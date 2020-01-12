# @param {String[]} strs
# @return {String}
def longest_common_prefix(a)
	temp = a[0]
	out = ''
    for i in 1..a.length-1 do
    	for j in 0..a[i].size-1 do
    		if temp[j] == a[i][j]
    			out << a[i][j]
    		else
    			break	
    		end	
    	end
    	temp = out
    	out = ''
    end
    temp
end

puts longest_common_prefix(["flower","flow","flight"])
puts longest_common_prefix(["dog","racecar","car"])