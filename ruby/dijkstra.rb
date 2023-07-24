# frozen_string_literal: true

graph = {
  start: {
    a: 6,
    b: 2
  },
  a: {
    end: 1
  },
  b: {
    a: 3,
    end: 5
  },
  end: {}
}

costs = {
  a: 6,
  b: 2,
  end: Float::INFINITY
}

parents = {
  a: 'start',
  b: 'start',
  end: nil
}

processed = []

def find_node_lower_cost(costs, processed)
  lower_cost = Float::INFINITY
  node_lower_cost = nil

  costs.each do |node, cost|
    if cost < lower_cost && !processed.include?(node)
      lower_cost = cost
      node_lower_cost = node
    end
  end

  node_lower_cost
end

def order_by_parents(parents)
  ordered = ['end']
  node = parents[:end]

  while node
    ordered.prepend(node)
    node = parents[node.to_sym]
  end

  ordered
end

# Dijsktra's algorithm
# Big O: O(n^2)
node = find_node_lower_cost(costs, processed)

while node
  cost = costs[node]
  neighbors = graph[node]

  neighbors.each do |neighbor, value|
    new_cost = cost + value

    if costs[neighbor] > new_cost
      costs[neighbor] = new_cost
      parents[neighbor] = node.to_s
    end
  end

  processed << node
  node = find_node_lower_cost(costs, processed)
end

p costs
p parents
p processed
p order_by_parents(parents)
