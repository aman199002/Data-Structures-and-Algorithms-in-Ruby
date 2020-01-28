# Say you have an array for which the ith element is the price of a given stock on day i.
# Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
# Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

# Time Complexity O(n)
# Space Complexity O(n)
def max_profit(a)
	profit = 0
	s = []  # NOTE: Initialize stack in form of array
	for i in 0..a.size-1 do
		# puts "s = #{s}, a[i] = #{a[i]}, profit = #{profit}"
		if s.empty?
			s.push(a[i])
		elsif a[i] > s[-1]
			s.push(a[i])
		else
			while !s.empty? do
				top = s[-1]
				s.pop
				profit = profit + (top - s[-1]) if !s.empty?
			end
			s.push(a[i])
		end
	end
	# Pop each element from stock untill its empty.
	# Add difference to profit.
	while !s.empty? do
		top = s[-1]
		s.pop
		profit = profit + (top - s[-1]) if !s.empty?
	end
	profit # Return max profit
end

puts max_profit([7,1,5,3,6,4])
puts max_profit([1,2,3,4,5])
puts max_profit([7,6,4,3,1])