# Power of Two
# Given an integer, write a function to determine if it is a power of two.


def is_power_of_two(n)
	return true if n == 1
	return false if n == 0
	return false if n%2 == 1
	is_power_of_two(n/2)
end

puts is_power_of_two(16)
puts is_power_of_two(218)
puts is_power_of_two(1)
puts is_power_of_two(10)
puts is_power_of_two(0)
