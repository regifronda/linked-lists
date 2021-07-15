class LinkedList
  attr_accessor :head

  def initialize(value)
    @head = Node.new(value, nil)
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize (value = nil, next_node = nil)
    @value = value
    @next_node = nil
  end
end