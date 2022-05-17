class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
     index = key.hash % num_buckets 
     if !@store[index].include?(key)
      @store[index] << key
      @count += 1
     end
    if @count > num_buckets
        resize!
    end
  end

  def include?(key)
    idx = key.hash % num_buckets
    @store[idx].include?(key)
  end

  def remove(key)
    if include?(key)
      index = key.hash % num_buckets
      bucket = @store[index]
      idx = bucket.index(key)
      bucket.delete_at(idx)
      @count -= 1
    end
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
