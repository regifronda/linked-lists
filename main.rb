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

  def pop
    return nil if @head == nil
    current = @head
    if current == @tail
      @head = @tail = nil
      @size = 0
      return current
      current = nil
    end
    while current do
      new_tail = current
      current = current.next_node
      if current == @tail
        @tail = new_tail
        @tail.next_node = nil
        @size -= 1
        if @length == 0
          @head = @tail = nil
        end
        puts current.value
        return current.value
      end
    end
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    @head = @tail = new_node if @head == nil
    @head = new_node if index == 0
    
    if index > 0
      before_current_times = index - 1
      current = @head
      before_current = @head
      before_current_times.times do
        before_current = current.next_node
      end
      index.times do
        current = current.next_node
      end
      after_current = before_current.next_node
      before_current.next_node = new_node
      new_node.next_node = after_current
    end
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
test.insert_at(5, 0)
test.to_s
test.append(5)
test.append(8)
test.prepend(9)
test.prepend(60)
test.insert_at(100, 2)
test.pop
test.to_s
test.at(1)
test.size
test.head
test.tail
test.contains?(3)
test.find(8)
test.find(55)