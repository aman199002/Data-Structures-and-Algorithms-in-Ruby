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
# Time Complexity = O(nlogn)
# Space Complexity = O(n)
def vertical_order(node)
	return [] if node == nil
	@h1 = {}
	vertical_order_util(node,0,1)
	puts
	@h1 = @h1.each{|k,v| @h1[k] = v.sort_by{|a| a[0]}.map{|a| a[1]}  }
	return(@h1.sort.to_h.values)
end

private

def vertical_order_util(node,x,level)
    if node == nil
        return
    end    
    if @h1[x]
        value = (@h1[x] << [level,node.val]).sort_by{|a| a[0]}
        @h1[x] = value
    else
        @h1[x] = [[level,node.val]]
    end
    vertical_order_util(node.left,x-1,level+1)
    vertical_order_util(node.right,x+1,level+1)
end    

node = TreeNode.new(1)
node.left = TreeNode.new(2)
node.right = TreeNode.new(3)
node.left.left = TreeNode.new(4)
node.left.right = TreeNode.new(5)
node.right.left = TreeNode.new(6)
node.right.right = TreeNode.new(7)
print vertical_order(node)

