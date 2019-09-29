def is_palindrome(n)
	n2 = 0
	while n != 0 do
		mod = n%10
		n = n/10
		n2 = n2*10 + mod
	end
	n == n2
end

n = 1331
is_palindrome(n)