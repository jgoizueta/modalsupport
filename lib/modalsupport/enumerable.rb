module Enumerable

  def grep_each(pattern)
    grep(pattern){|str| yield(Regexp.last_match)}
  end

  if_ruby_version :<, "1.8.7" do
    require 'enumerator'
    alias enumerator_each_slice each_slice
    def each_slice(n, &blk)
      if blk
        # each_slice is implemented in the enumerator extension, requiring a block, and is used by enum_slice
        enumerator_each_slice(n, &blk)
      else
        enum_slice(n, &blk)
      end
    end
  end

  def each_pair(&blk)
    each_slice(2, &blk)
  end

  # Convert to pairs [[e1,e2], [e3,e4], ...]
  # Note that for a Hash, this is equivalent to hash.to_a.to_pairs which may not be what's intended; hash.to_a is
  # an array of key-value pairs; to_pairs is an array of pairs of key-value pairs.
  def to_pairs
    each_pair.to_a
  end

  # cartesian product
  #  note that for Ruby >= 1.8.7 a.each_product_pair(b).to_a == a.to_a.product(b.to_a)
  def each_product_pair(other)
    if block_given?
      self.each do |this|
        other.each do |that|
          yield [this, that]
        end
      end
    else
      enum_for(:each_product_pair, other)
    end
  end

  # Paralell iteration through multiple enumerable objects
  #   (1..3).paralell_each([:a,:b,:c],(10..12)).to_a
  #    => [[1, :a, 10], [2, :b, 11], [3, :c, 12]]   
  # 
  #   e.paralell_each(*enums) = e.zip(*enums).each
  def paralell_each(*enums, &blk)
    # Note that to implement a lazy iterator we'd need
    # external iterators which don't work in Rubinius, are
    # implemented differently  in Ruby < 1.8.7 and are slow.
    # So, for the time being we generate an array and then
    # iterate it.    
    if block_given?
      zip(*enums).each(&blk)
    else
      enum_for(:paralell_each, *enums)
    end
  end
  
  # Equivalent to paralell_each(*enums).to_a, but more efficient
  def paralell_array(*enums)
    zip(*enums)
  end
  
  # Cross-product iteration through multiple enumerable objects
  #   (1..4).cross_each([:a,:b,:c],(11..12)).to_a
  #   => [[1, :a, 11], [1, :a, 12], [1, :b, 11], [1, :b, 12], [1, :c, 11], [1, :c, 12],
  #       [2, :a, 11], [2, :a, 12], [2, :b, 11], [2, :b, 12], [2, :c, 11], [2, :c, 12],
  #       [3, :a, 11], [3, :a, 12], [3, :b, 11], [3, :b, 12], [3, :c, 11], [3, :c, 12],
  #       [4, :a, 11], [4, :a, 12], [4, :b, 11], [4, :b, 12], [4, :c, 11], [4, :c, 12]]
  #
  #  e.cross_each(*enums) = e.to_a.product(*enums.map{|enum| enum.to_a}).each
  def cross_each(*enumerables)
    if block_given?
      enumerable, *rest = enumerables
      self.each do |e|
        if enumerables.empty?
          yield [e]
        else
          enumerable.cross_each(*rest) do |rest_e|
            yield [e]+rest_e
          end
        end
      end
    else
      enum_for(:cross_each, *enumerables)
    end
  end
  
  # equivalent to cross_each(*enumerables).to_a, but more efficient
  def cross_array(*enumerables) 
    # return to_a.product(*enumerables.map{|e| e.to_a})
    enumerables.unshift self
    result = [[]]
    while !enumerables.empty?
      t, result = result, []
      b, *enumerables = enumerables
      t.each do |a|
        b.each do |n|
          result << a + [n]
        end
      end
    end
    result
  end
  

end
