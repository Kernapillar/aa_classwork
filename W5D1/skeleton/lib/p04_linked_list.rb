class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
     @head.next
  end

  def last
    @tail.prev
  end

  def empty?
     return true if @head.next == @tail
     false
  end

  def get(key)
    current = @head
    while current.key != key && current.next != @tail
      current = current.next
      return current.val if current.key == key
    end
    return nil
    
  end

  def include?(key)
    current = @head
    while current.key != key && current.next != @tail
      current = current.next
      return true if current.key == key
    end
    return false
  end

  def append(key, val)
    node = Node.new(key, val)
    node.next = @tail
    @tail.prev.next = node
    @tail.prev = node
  end

  def update(key, val)
    current = @head
    while current.key != key && current.next != @tail
      current = current.next
    end
    current.val = val if current.key == key
  end

  def remove(key)
    current = @head
    while current.key != key && current.next != @tail
      current = current.next
    end
    current.prev.next = current.next
    current.next.prev = current.prev
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
