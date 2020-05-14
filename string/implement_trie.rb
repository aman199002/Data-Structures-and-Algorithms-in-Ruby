# Implement a trie with insert, search, and startsWith methods.

# Example:

# Trie trie = new Trie();

# trie.insert("apple");
# trie.search("apple");   // returns true
# trie.search("app");     // returns false
# trie.startsWith("app"); // returns true
# trie.insert("app");   
# trie.search("app");     // returns true


class Trie

=begin
    Initialize your data structure here.
=end
    def initialize()
       @words = [] 
    end


=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
    def insert(word)
       @words << word 
       return nil
    end


=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
    def search(word)
        for i in 0..@words.size-1 do
            if @words[i] == word
                return true
            end    
        end    
        return false
    end


=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
    def starts_with(prefix)
        for i in 0..@words.size-1 do
            if @words[i].index(prefix) == 0
                return true
            end    
        end 
        return false
    end

end

trie = Trie.new

puts trie.insert("apple");
puts trie.search("apple")
puts trie.search("app")
puts trie.starts_with("app")
puts trie.insert("app")
puts trie.search("app")

