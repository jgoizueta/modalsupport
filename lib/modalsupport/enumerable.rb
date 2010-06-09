module Enumerable

  def grep_each(pattern)
    grep(pattern){|str| yield(Regexp.last_match)}
  end

  if RUBY_VERSION < "1.8.7"
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


end
