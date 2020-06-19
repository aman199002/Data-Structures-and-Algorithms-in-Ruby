# Active and Inactive cells after k Days
# Given a binary array of size n where n > 3. A true (or 1) value in the array means active and false (or 0) means inactive. 
# Given a number k, the task is to find count of active and inactive cells after k days. After every day, status of i’th cell becomes active if left and right cells are not same and inactive if left and right cell are same (both 0 or both 1).
# Since there are no cells before leftmost and after rightmost cells, the value cells before leftmost and after rightmost cells is always considered as 0 (or inactive).

# Example:
# Input  : cells[] = {1, 0, 1, 1}, k = 2
# Output : Active cells = 3, Inactive cells = 1
# After 1 day,  cells[] = {0, 0, 1, 1}
# After 2 days, cells[] = {0, 1, 1, 1}

def cellCompete(a, k)
    n = a.size    
    while k > 0 do
        _a = []
        for i in 0..a.size-1 do
            prev = i == 0 ? 0 : a[i-1]
            nxt = i==n-1 ? 0 : a[i+1]
            if prev == nxt
                _a[i] = 0
            else
                _a[i] = 1
            end    
        end
        k = k-1
        a = _a
    end
    return _a
end

print cellCompete([1,0,0,0,0,1,0,0], 1)
puts
print cellCompete([], 2)



# [1,1,]
