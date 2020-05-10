# Find the Town Judge

# In a town, there are N people labelled from 1 to N.  There is a rumor that one of these people is secretly the town judge.

# If the town judge exists, then:

# The town judge trusts nobody.
# Everybody (except for the town judge) trusts the town judge.
# There is exactly one person that satisfies properties 1 and 2.
# You are given trust, an array of pairs trust[i] = [a, b] representing that the person labelled a trusts the person labelled b.

# If the town judge exists and can be identified, return the label of the town judge.  Otherwise, return -1.

# Example:

# Input: N = 2, trust = [[1,2]], Output: 2

# Input: N = 3, trust = [[1,3],[2,3]], Output: 3 

# Input: N = 3, trust = [[1,3],[2,3],[3,1]], Output: -1

# Input: N = 4, trust = [[1,3],[1,4],[2,3],[2,4],[4,3]], Output: 3

# @param {Integer} n
# @param {Integer[][]} trust
# @return {Integer}
# Here we need to find a person which is trusted by n-1 and it trusts 0.
# Initialize an array count of size n+1 with each subarray equal to [0,0]. This array will store data for people in each index, that's why n+1.
# In this array, in each subarray we will store count of people he trust as first element, and count of people trusting him as second element.
# After storing all the values in this array, we will iterate and find pair where second element is n-1 and first element is 0.
# If no value is found with this condition in whole array, return -1.
def find_judge(n, trust)
    count = Array.new(n+1){ Array.new(2) {0}}
    trust.each do |pair|    	
    	count[pair[0]][0] = count[pair[0]][0] + 1
    	count[pair[1]][1] = count[pair[1]][1] + 1
    end
    for i in 1..n do
    	if count[i][1] == n-1 && count[i][0] == 0
    		return i
    	end	
    end
    return -1
end

puts find_judge(4,[[1,3],[1,4],[2,3],[2,4],[4,3]])