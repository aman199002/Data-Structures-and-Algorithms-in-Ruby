# Online Stock Span

# Write a class StockSpanner which collects daily price quotes for some stock, and returns the span of that stock's price for the current day.
# The span of the stock's price today is defined as the maximum number of consecutive days (starting from today and going backwards) for which the price of the stock was less than or equal to today's price.
# For example, if the price of a stock over the next 7 days were [100, 80, 60, 70, 60, 75, 85], then the stock spans would be [1, 1, 1, 2, 1, 4, 6].


# Example:

# Input: ["StockSpanner","next","next","next","next","next","next","next"], [[],[100],[80],[60],[70],[60],[75],[85]]
# Output: [null,1,1,1,2,1,4,6]

class StockSpanner
    def initialize()
        @s = [] #Initialize empty stack
    end


=begin
    :type price: Integer
    :rtype: Integer
=end
    def next(price)
        counter = 1
        # If stack is empty or stack top element is greater than given price, push price to stack.
        if @s.empty? || @s[-1][0] > price
            @s.push([price,counter])
        else
            # Traverse till price is greater than stack top element.
            # Pop price from stack and increment counter by adding popped item value.
            while !@s.empty? && @s[-1][0] <= price
                popped_item = @s.pop
                counter = counter + popped_item[1]
            end
            # When stack has been traversed, push current price to stack.
            @s.push([price,counter])
        end
        return(counter)
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