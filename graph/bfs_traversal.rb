class Node
	attr_accessor :val, :adjacent_nodes

	def initialize(val)
		@val = val
		@adjacent_nodes = []
	end

	def add_edge(adjacent_node)
		@adjacent_nodes << adjacent_node
	end

end

class Graph

	def inialize
		@nodes = []
	end	

	def add_node(node)
		@nodes[node.val] = node
	end	

	def add_edge(node1,node2)
		node1.add_edge(node2)
		node2.add_edge(node1)
	end	

end

# Level order traversal using queue same like tree.
def bfs(node)
	q = [node]  # Initialize a queue add push first node to it.
	# Take a visited array to store if node has been visited. For first node store true.
	visited = []
	visited[node.val] = true
	# Traverse till queue is not empty.
	while !q.empty? do
		# Pop first node from queue and print its value.
		popped_item = q.pop
		print popped_item.val
		print ' '
		# Push all adjacent nodes to queue and mark visited as true conditioned that node is not visited before.
		popped_item.adjacent_nodes.each do |adj_node|
			if !visited[adj_node.val]
				q.unshift(adj_node)
				visited[adj_node.val] = true
			end
		end
	end
end

node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)
node5 = Node.new(5)
node6 = Node.new(6)

g = Graph.new
g.add_edge(node1, node2);
g.add_edge(node1, node3);
g.add_edge(node2, node4);
g.add_edge(node2, node5);
g.add_edge(node3, node5);
g.add_edge(node4, node5);
g.add_edge(node4, node6);
g.add_edge(node5, node6);

bfs(node1)
