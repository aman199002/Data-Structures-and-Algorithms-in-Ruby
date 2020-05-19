# Online Stock Span

# Write a class StockSpanner which collects daily price quotes for some stock, and returns the span of that stock's price for the current day.
# The span of the stock's price today is defined as the maximum number of consecutive days (starting from today and going backwards) for which the price of the stock was less than or equal to today's price.
# For example, if the price of a stock over the next 7 days were [100, 80, 60, 70, 60, 75, 85], then the stock spans would be [1, 1, 1, 2, 1, 4, 6].


# Example:

# Input: ["StockSpanner","next","next","next","next","next","next","next"], [[],[100],[80],[60],[70],[60],[75],[85]]
# Output: [null,1,1,1,2,1,4,6]

class StockSpanner
    def initialize()
        @a = []
    end


=begin
    :type price: Integer
    :rtype: Integer
=end
    def next(price)
    	@a << price  # Insert price to array.
    	i = @a.size-2
    	counter = 1
        # Backtrack array with conditions.
        # If previous price is smaller than given price, incremenet counter and decrement pointer i.
        # If previous price is greater than given price, return counter.
    	while i >= 0 do
    		if @a[i] > price
    			return counter
    		end
    		counter = counter + 1
    		i = i-1
    	end
    	return counter
    end


end

obj = StockSpanner.new()
puts obj.next(100)
puts obj.next(80)
puts obj.next(60)
puts obj.next(70)
puts obj.next(60)
puts obj.next(75)
puts obj.next(85)