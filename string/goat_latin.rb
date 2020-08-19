# Goat Latin

# A sentence S is given, composed of words separated by spaces. Each word consists of lowercase and uppercase letters only.
# We would like to convert the sentence to "Goat Latin" (a made-up language similar to Pig Latin.)
# The rules of Goat Latin are as follows:

# If a word begins with a vowel (a, e, i, o, or u), append "ma" to the end of the word.
# For example, the word 'apple' becomes 'applema'.
 
# If a word begins with a consonant (i.e. not a vowel), remove the first letter and append it to the end, then add "ma".
# For example, the word "goat" becomes "oatgma".
 
# Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
# For example, the first word gets "a" added to the end, the second word gets "aa" added to the end and so on.
# Return the final sentence representing the conversion from S to Goat Latin. 

# Example:

# Input: "I speak Goat Latin"
# Output: "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"

# Input: "The quick brown fox jumped over the lazy dog"
# Output: "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogd

# @param {String} s
# @return {String}
def to_goat_latin(s)
    a = s.split(' ')
    res = ''
    for i in 0..a.size-1 do
        append_val = 'maa' + 'a'*i
        if !is_vowel?(a[i][0])
            first_char = a[i][0]
            remaining = a[i][1..-1]
            val = remaining + first_char
        else
            val = a[i]
        end
        val = val + append_val
        res.empty? ? res.concat(val) : res.concat(' ').concat(val)
    end
    return res
end

private

def is_vowel?(chr)
    chr = chr.downcase
    chr == 'a' || chr == 'e' || chr == 'i' || chr == 'o' || chr == 'u'
end

puts to_goat_latin("The quick brown fox jumped over the lazy dog")
puts to_goat_latin("a")
puts to_goat_latin("Each word consists of lowercase and uppercase letters only")
puts to_goat_latin("")
