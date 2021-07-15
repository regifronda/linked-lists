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

    puts "@head before if-else: "
    p @head

    if @head == nil

      puts "passed through if statement"
      @head = @tail = new_node

      p "@head:"
      p @head
    else

      puts "passed through else"
      
      old_tail = @tail
      @tail = new_node
      old_tail.next_node = @tail
      
    end
    p "@head after if-else statement:"
    p @head

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
test.append(8)
test.to_s
