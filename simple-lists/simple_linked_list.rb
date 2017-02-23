require 'pry'

class Node
  attr_accessor :data
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
  attr_accessor :hash

  def initialize(data)
    @data = data
    @node = Node.new(data, nil)
    @counter = 0
    @hash = {@counter => @node}
  end

  def head
    @node
  end

  def index_at(index)
    if @hash[index]
      @hash[index].data
    else
      nil
    end
  end

  def insert_at_index(index, data)
    if !@hash[index]
      @hash[index] = Node.new(data, nil)
    else
      @hash[index+1] = @hash[index]
      @hash[index] = Node.new(data, nil)
    end
  end

  def unshift(data)
    counter = 0
    until !@hash[counter]
      counter +=1
    end
    until counter <= 0
      @hash[counter] = @hash[counter-1]
      counter -=1
    end

    @hash[0] = Node.new(data, nil)
  end

  def push(data)
    counter = 0
    until !@hash[counter]
      counter +=1
    end
    @hash[counter] = Node.new(data, nil)
  end


end
