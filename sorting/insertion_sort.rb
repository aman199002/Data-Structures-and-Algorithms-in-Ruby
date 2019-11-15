def sort(a)
	for i in 1..a.size-1 do
		key = a[i]
		j = i-1
		while j >= 0 && a[j] > key do
			a[j+1] = a[j]
			j = j-1
		end
		a[j+1] = key
	end
	a
end

print sort([4,3,2,10,12,1,5,6])
print sort([1,2,3,4,5,6,7,8,9])