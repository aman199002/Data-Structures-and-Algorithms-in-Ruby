# Multiply Strings
# Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

# Example:

# Input: num1 = "2", num2 = "3"
# Output: "6"

# Input: num1 = "123", num2 = "456"
# Output: "56088"

# Note:

# The length of both num1 and num2 is < 110.
# Both num1 and num2 contain only digits 0-9.
# Both num1 and num2 do not contain any leading zero, except the number 0 itself.
# You must not use any built-in BigInteger library or convert the inputs to integer directly.

# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(s1, s2)
    num1 = 0
    for i in 0..s1.size-1 do
        num1 = num1*10 + get_num(s1[i])
    end    
    num2 = 0
    for i in 0..s2.size-1 do
        num2 = num2*10 + get_num(s2[i])
    end    
    return (num1*num2).to_s
end

private

def get_num(char)
    '0'.ord - char.ord
end    

puts multiply("123","456")
puts multiply("0123","432423")
puts multiply("1230","432423")
