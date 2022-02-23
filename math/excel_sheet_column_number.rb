# Excel Sheet Column Number
# Given a string columnTitle that represents the column title as appear in an Excel sheet, return its corresponding column number.

# Example:
# A -> 1
# B -> 2
# C -> 3
# ...
# Z -> 26
# AA -> 27
# AB -> 28
# XY -> 649
# AAA -> 703 

# @param {String} column_title
# @return {Integer}
def title_to_number(column_title)
    size = column_title.size
    char_hash = {"A"=>1, "B"=>2, "C"=>3, "D"=>4, "E"=>5, "F"=>6, "G"=>7, "H"=>8, "I"=>9, "J"=>10, "K"=>11, "L"=>12, "M"=>13, "N"=>14, "O"=>15, "P"=>16, "Q"=>17, "R"=>18, "S"=>19, "T"=>20, "U"=>21, "V"=>22, "W"=>23, "X"=>24, "Y"=>25, "Z"=>26} 
    num = 0
    i = 0
    while size > 0 do
        num = num+((26**(size-1))*char_hash[column_title[i]])
        size = size-1
        i = i+1
    end    
    return num
end

puts title_to_number("XY")
puts title_to_number("ZY")
puts title_to_number("AAA")
puts title_to_number("ASFSDJZ")
