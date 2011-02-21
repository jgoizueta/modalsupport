class Array
  
  # backport of Ruby 1.9.2 Array#rotate
  unless [].respond_to?(:rotate)
    def rotate(n=1)
      n = (n % self.size)
      n>0 ? self[n..-1] + self[0...n] : self
    end
  end
  unless [].respond_to?(:rotate!)
    def rotate!(n=1)
      self.replace(self.rotate(n))
    end
  end
  
  # backport of Ruby 1.8.7 Array#index(){...}
  if_ruby_version :<, '1.8.7' do
    unless [].respond_to?(:index_without_block)
      alias index_without_block index
      def index(*args, &blk)
        if args.empty?
          index_without_block(find(&blk))
        else
          index_without_block(*args, &blk)
        end
      end
    end
  end
  
  # create a hash from an array of [key,value] tuples
  # you can set default or provide a block just as with Hash::new
  # Note: if you use [key, value1, value2, value#], hash[key] will
  # be [value1, value2, value#]
  def to_h(default=nil, &block)
    # code by Stefan Rusterholz fixed for Ruby 1.9.2; see http://www.ruby-forum.com/topic/138218
    hash = block_given? ? Hash.new(&block) : Hash.new(default)
    each { |(key, *value)| hash[key]=value.size>1 ? value : value.first }
    hash
  end
  
end
