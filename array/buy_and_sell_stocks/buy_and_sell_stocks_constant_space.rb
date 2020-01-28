# Say you have an array for which the ith element is the price of a given stock on day i.
# Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
# Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

# Time Complexity O(n)
# Space Complexity O(1)
def max_profit(a)
	profit = 0
	for i in 0..a.size-2 do
		if a[i] < a[i+1]
			profit = profit + (a[i+1] - a[i])
		end	
	end
	profit # Return max profit
end

puts max_profit([7,1,5,3,6,4])
puts max_profit([1,2,3,4,5])
puts max_profit([7,6,4,3,1])