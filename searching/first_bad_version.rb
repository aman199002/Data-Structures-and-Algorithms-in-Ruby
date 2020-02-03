# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
    left = 1
    right = n
    while right > left do
        mid = left + (right - left)/2
        puts "left=#{left} right=#{right} mid = #{mid}"
        if is_bad_version(mid)
            right = mid            
        else
            left = mid+1
        end    
    end
    left
end