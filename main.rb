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
    p "@head before if: #{@head}" 
    if @head == nil
      @head = @tail = new_node
    else
      @tail.next = new_node
      @tail = new_node

      p @head
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
    puts result.join(', ')
    #return result
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

test.to_s
