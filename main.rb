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

  def pop
    return nil if @head == nil
    current = @head
    if current == @tail
      @head = @tail = nil
      @size = 0
      return current
      old_tail = @tail
      @tail = new_node
      old_tail.next_node = @tail
    end
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

  def get_linked_list_as_array
    result = []
    current = @head
    while current && current.next_node != nil
      result << current.value
      current = current.next_node
    end
    result << current.value if current
    return result
  end
  
  def to_s
    result = get_linked_list_as_array
    result << "nil"
    result_message = result.join(' -> ')
    puts result_message
    result_message
  end

  def at(index)
    linked_list = get_linked_list_as_array
    result = linked_list[index]
    puts result
    return result
  end

  def contains?(value)
    linked_list = get_linked_list_as_array
    result = linked_list.include? value
    puts result
    return result
  end
  
  def find(value)
    linked_list = get_linked_list_as_array
    result = linked_list.index(value)
    if result == nil
      puts "nil"
    else
      puts result
      return result
    end
  end

  def size
    puts @size
    return
  end

  def head
    p @head.value
  end

  def tail
    p @tail.value
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
test.pop
test.append(5)
test.append(8)
test.prepend(9)
test.to_s
test.at(1)
test.size
test.head
test.tail
#test.contains?(3)
test.find(8)
test.find(55)