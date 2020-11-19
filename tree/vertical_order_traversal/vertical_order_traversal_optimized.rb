class TreeNode
    attr_accessor :val, :left, :right
    
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

# @param {TreeNode} root
# @return {Integer[][]}
# Time Complexity = O(n)
# Space Complexity = O(n)
def vertical_order(node)
    return [] if node == nil
    @h1 = {}
    q = [[node,0]]
    while !q.empty? do
        # puts "q = #{q}"
        popped_item = q.pop
        if @h1[popped_item[1]]
            values = @h1[popped_item[1]] << popped_item[0].val
            @h1[popped_item[1]] = values
        else
            @h1[popped_item[1]] = [popped_item[0].val]
        end    
        if popped_item[0].left
            q.unshift([popped_item[0].left,(popped_item[1]-1)])
        end    
        if popped_item[0].right
            q.unshift([popped_item[0].right,(popped_item[1]+1)])
        end    
    end    
    # puts "@h1 = #{@h1}"
    return @h1.sort.to_h.values
end

node = TreeNode.new(1)
node.left = TreeNode.new(2)
node.right = TreeNode.new(3)
node.left.left = TreeNode.new(4)
node.left.right = TreeNode.new(5)
node.right.left = TreeNode.new(6)
node.right.right = TreeNode.new(7)
print vertical_order(node)


