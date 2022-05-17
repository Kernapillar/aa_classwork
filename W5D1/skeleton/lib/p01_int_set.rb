class MaxIntSet

  attr_reader :store, :max

  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0

    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    index = num % num_buckets
    @store[index] << num
  end

  def remove(num)
    index = num % num_buckets
    bucket = @store[index]
    idx = bucket.index(num)
    bucket.delete_at(idx)
  end

  def include?(num)
    index = num % num_buckets
    @store[index].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    idx = num % num_buckets
    if !@store[idx].include?(num)
      @store[idx] << num
      @count += 1
    end
    if @count > num_buckets
        resize!
    end
  end

  def remove(num)
    if include?(num)
      index = num % num_buckets
      bucket = @store[index]
      idx = bucket.index(num)
      bucket.delete_at(idx)
      @count -= 1
    end
  end

  def include?(num)
    idx = num % num_buckets
    @store[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
   new_store = @store.flatten
   buckets = num_buckets
   @store = Array.new(buckets * 2) { Array.new }
   @count = 0
   new_store.each do |el|
     insert(el)
   end
  end
end
