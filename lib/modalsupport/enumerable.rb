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

  if_ruby_version(:<, '1.8.7') do
    require 'generator'
    
    # Paralell iteration through multiple enumerable objects
    #   (1..3).paralell_each([:a,:b,:c],(10..12)).to_a
    #    => [[1, :a, 10], [2, :b, 11], [3, :c, 12]]    
    def paralell_each(*enums)
      if block_given?
        iterators = ([self]+enums).map{|e| Generator.new(e)}
        loop {
          begin
            yield iterators.map{|e| e.next}
          rescue EOFError
            break
          end
        }
      else
        enum_for(:paralell_each, *enums)
      end
    end
    
    # Cross-product iteration through multiple enumerable objects
    #   (1..4).cross_each([:a,:b,:c],(11..12)).to_a
    #   => [[1, :a, 11], [1, :a, 12], [1, :b, 11], [1, :b, 12], [1, :c, 11], [1, :c, 12],
    #       [2, :a, 11], [2, :a, 12], [2, :b, 11], [2, :b, 12], [2, :c, 11], [2, :c, 12],
    #       [3, :a, 11], [3, :a, 12], [3, :b, 11], [3, :b, 12], [3, :c, 11], [3, :c, 12],
    #       [4, :a, 11], [4, :a, 12], [4, :b, 11], [4, :b, 12], [4, :c, 11], [4, :c, 12]]
    def cross_each(*enumerables)
      if block_given?
        enumerators = ([self]+enumerables).map{|e| Generator.new(e)}
        values = enumerators.map{|e| e.next rescue nil}
        yield values.dup
        i = values.size - 1
        loop do
          if enumerators[i].next?
            values[i] = enumerators[i].next
            yield values.dup # we could leave dupping up to the user, but .to_a would fail  
            i = values.size - 1
          else
            enumerators[i].rewind
            values[i] = enumerators[i].next
            i -= 1
            if i<0
              break
            end
          end
        end
      else
        enum_for(:cross_each, *enumerables)
      end
    end
  
  end

  if_ruby_version(:>=, '1.8.7') do
    # Paralell iteration through multiple enumerable objects
    #   (1..3).paralell_each([:a,:b,:c],(10..12)).to_a
    #    => [[1, :a, 10], [2, :b, 11], [3, :c, 12]]    
    def paralell_each(*enums)
      if block_given?
        iterators = ([self]+enums).map{|e| e.to_enum}
        loop {
          yield iterators.map{|e| e.next}
        }
      else
        enum_for(:paralell_each, *enums)
      end
    end

    # Cross-product iteration through multiple enumerable objects
    #   (1..4).cross_each([:a,:b,:c],(11..12)).to_a
    #   => [[1, :a, 11], [1, :a, 12], [1, :b, 11], [1, :b, 12], [1, :c, 11], [1, :c, 12],
    #       [2, :a, 11], [2, :a, 12], [2, :b, 11], [2, :b, 12], [2, :c, 11], [2, :c, 12],
    #       [3, :a, 11], [3, :a, 12], [3, :b, 11], [3, :b, 12], [3, :c, 11], [3, :c, 12],
    #       [4, :a, 11], [4, :a, 12], [4, :b, 11], [4, :b, 12], [4, :c, 11], [4, :c, 12]]
    def cross_each(*enumerables)
      if block_given?
        enumerators = ([self]+enumerables).map{|e| e.to_enum}
        values = enumerators.map{|e| e.next rescue nil}
        yield values.dup
        i = values.size - 1
        loop do
          begin 
            values[i] = enumerators[i].next
          rescue StopIteration
            enumerators[i].rewind
            values[i] = enumerators[i].next
            i -= 1
            if i<0
              break
            end
          else
            yield values.dup # we could leave dupping up to the user, but .to_a would fail  
            i = values.size - 1
          end
        end
      else
        enum_for(:cross_each, *enumerables)
      end
    end
  end


end
