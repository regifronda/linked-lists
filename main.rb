class LinkedList
  attr_accessor :head, :tail, :length

  def initialize(value)
    @head = nil
    @tail = nil
    @length = 0
  end

  def append(value)
    node = Node.new()
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize (value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end