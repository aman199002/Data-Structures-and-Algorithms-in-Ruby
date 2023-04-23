class Node
  attr_accessor :left,:right,:val

  def initialize(val)
    @val = val
  end

end

# @param {Node} root
# @return {Integer[][]}
def zigzag_level_order(node)
  return [] if node == nil
  q = [[node,1]]
  res = {}
  while q.size > 0 do
    curr_items = []
    popped_item,level = q.pop
    if res[level]
      if level%2 != 0
        res[level] = res[level].unshift(popped_item.val)
      else
        res[level] << popped_item.val
      end
    else
      res[level] = [popped_item.val]
    end
    q.push([popped_item.left,level+1]) if popped_item.left
    q.push([popped_item.right,level+1]) if popped_item.right
  end
  # puts "res = #{res}"
  return res.values
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
root.left.left.left = Node.new(8)
root.left.left.right = Node.new(9)
root.left.right.left = Node.new(10)
res = zigzag_level_order(root)
puts "res = #{res}"