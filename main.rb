require 'pry'

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    if @head == nil
      @head = @tail = new_node
    else      
      old_tail = @tail
      @tail = new_node
      old_tail.next_node = @tail
    end
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head == nil
      @head = @tail = new_node
    else      
      old_head = @head
      @head = new_node
      @head.next_node = old_head
    end
    @size += 1
  end

  def to_s
    result = []
    current = @head

    while current && current.next_node != nil
      result << current.value
      current = current.next_node
    end
    result << current.value if current
    result << "nil"
    puts result.join(' -> ')
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize (value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

test = LinkedList.new
test.append(5)
test.append(8)
test.append(9)

test.to_s
