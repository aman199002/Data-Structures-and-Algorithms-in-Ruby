def nth_ugly_number(n)
	arr = [1]
	i2 = 0
	i3 = 0
	i5 = 0
	next2 = 2
	next3 = 3
	next5 = 5
	for i in 1..n-1 do
		min = find_min(next2,next3,next5)
		arr[i] = min
		if min == next2
			i2 = i2+1
			next2 = arr[i2]*2
		end	
		if min == next3
			i3 = i3+1
			next3 = arr[i3]*3
		end	
		if min == next5	
			i5 = i5+1
			next5 = arr[i5]*5		
		end	
	end
	arr[n-1]
end

private

def find_min(a,b,c)
	if a <= b && a <= c
		a
	elsif b <= a && b <= c
		b
	else
		c
	end	
end	

print nth_ugly_number(100)