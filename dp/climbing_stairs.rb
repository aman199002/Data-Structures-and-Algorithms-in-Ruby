# Climbing Stairs
# You are climbing a stair case. It takes n steps to reach to the top.
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

# Example:
# Input: 2
# Output: 2
# Explanation: There are two ways to climb to the top.
# 1. 1 step + 1 step
# 2. 2 steps

# Input: 3
# Output: 3
# Explanation: There are three ways to climb to the top.
# 1. 1 step + 1 step + 1 step
# 2. 1 step + 2 steps
# 3. 2 steps + 1 step

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
    return 0 if n <= 0  # Return 0 if number of steps less than or equal to 0.
    # Return 0 if number of steps equal to 1.
    if n == 1
        return 1
    end
    dp = Array.new(n+1)  # Initialize array to store solution for each step.
    dp[1] = 1   # No of ways for step 1.
    dp[2] = 2   # No of ways for step 2.
    for i in 3..n do
        dp[i] = dp[i-1]+ dp[i-2]  # No of ways to climb each each step is the sum of no of steps for previous 2 steps.
    end
    return dp[n]  # Returm no of steps for given number
end

puts climb_stairs(3)
puts climb_stairs(5)
puts climb_stairs(8)
puts climb_stairs(12)
