# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
    num = 0
    for i in 0..digits.length-1 do
        num = num * 10 + digits[i]
    end
    num = num + 1
    digits = []
    while num != 0 do
        reminder = num%10
        num = num/10        
        digits.unshift(reminder)
    end
    digits
end

print plus_one([1,2,3])
print plus_one([1,2,9])