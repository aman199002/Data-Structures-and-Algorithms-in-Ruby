# Function to print steps for shifting disks from tower A to C
def toh(n,a,b,c)
	if n > 0
		toh(n-1,a,c,b) # Call function recursively to move n-1 disks from A to C using B
		puts "Move 1 disk from #{a} to #{c}" # Move 1 disk from A to C
		toh(n-1,b,a,c) # Call function recursively to move n-1 disks from B to C using A
	end	
end

n = 3
toh(n,1,2,3) #1,2,3 are tower numbers respectivbely for towers A,B,C