require 'pry'

class Node
  attr_accessor :data, :next_node
  def initialize(data, next_node)
    @data = data
    @next_node = next_node
  end

  def next
    if @next_node != nil
      @next_node
    elsif @next_node == nil
      nil
    end
  end

end

class LinkedList
  attr_accessor :head
  def initialize(data)
    @data = data
    @head = Node.new(data, nil)
    @counter = 0
  end


  def index_at(index)
    node = find_node_at_index(index)
    if node
      node.data
    else
      nil
    end
  end

  def insert_at_index(index, data)
    new_node = Node.new(data, nil)

    index2 = 0
    until index2 == index
      if find_node_at_index(index2)
        index2 += 1
      else
        find_node_at_index(index2-1).next_node = Node.new(nil, nil)
      end
    end



    if find_node_at_index(index)
      replaced_node = find_node_at_index(index)
      new_node.next_node = replaced_node
    end


    preceding_node = find_node_at_index(index-1)
    preceding_node.next_node = new_node

  end

  def find_node_at_index(index)
    node = @head

    while index > 0
      node = node.next
      index -= 1
    end

    if !node
      nil
    else
      node
    end
  end

  def unshift(data)
    @head = Node.new(data, @head)

  end

  def push(data)
    node = @head
    until node.next_node == nil
      node = node.next
    end
    node.next_node = Node.new(data, nil)

  end


end
