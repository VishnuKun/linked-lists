# frozen_string_literal: true

require_relative 'node'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next = new_node
      @tail = new_node
    end
  end

  def prepend(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
    else
      current_head = new_node
      current_head.next = @head
      @head = current_head
    end

  end

  def size
    current_head = @head
    size = 0
    while current_head
      size += 1
      current_head = current_head.next
    end
    size 
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    current_head = @head
    i = 0
    while current_head
      if i == index
        return current_head
      end
      i += 1
      current_head = current_head.next
    end
  end

  def pop
    return if @head.nil?
    if @head.next.nil?
      @head = nil
    else
      current_head = @head
      while current_head.next.next
        current_head = current_head.next
      end
      current_head.next = nil
    end
  end

  def contains(value)
    current_head = @head
    while current_head
      if current_head.data == value
        return true
        break
      end
      current_head = current_head.next
    end
    return false
  end

  def find(value)
    current_head = @head
    i = 0
    while current_head
      if current_head.data == value
        return i
        break
      end
      i += 1
      current_head = current_head.next
    end
    return nil
  end

  def to_s
    output = ""
    current_head = @head
    while current_head
      value = current_head.data
      output += "(#{value}) -> "
      current_head = current_head.next
    end
    output += "nil"
    return output
  end

  def insert_at(value, position)
    new_node = Node.new(value)

    if position <= 0
      new_node.next = @head
      @head = new_node
    elsif position >= size
      @tail.next = new_node
      @tail = new_node
    else
      current = @head
      (position - 1).times do
        current = current.next
      end
      new_node.next = current.next
      current.next = new_node
    end
  end

  def remove_at(position)
    if @head.nil?
      puts "List is empty. Nothing to delete."
      return
    end

    if position <= 0
      @head = @head.next
      if @head.nil?
        @tail = nil
      end
    elsif position >= size - 1
      current = @head
      (size - 2).times do
        current = current.next
      end
      current.next = nil
      @tail = current
    else
      current = @head
      (position - 1).times do
        current = current.next
      end
      current.next = current.next.next
    end
  end
end
