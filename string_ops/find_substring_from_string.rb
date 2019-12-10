def find_substring(str,sub)
	l1 = str.length
	l2 = sub.length
	for i in 0..l1-l2+1 do
		for j in 0..l2 do
			puts "j = #{j}"
			puts "sub[j] = #{sub[j]} str[i+j] = #{str[i+j]}"
			if str[i+j] != sub[j]
				break
			end
		end
		puts "i = #{i} j = #{j}"
		if j == l2
			return i
		end
	end
	return -1
end

print find_substring("my real name is aman",'namw')