def rotate(a,k)
	n = a.length
	k = k % n
	count = 0
	for i in 0..n-1 do
		break if count >= n
		current = i
		prev = a[i]
		loop do
			nxt = (current + k) % n
			temp = a[nxt]
			a[nxt] = prev
			prev = temp
			current = nxt
			count = count + 1
			break if i == current
		end		
	end
	a
end

print rotate([1,2,3,4,5,6,7],3)