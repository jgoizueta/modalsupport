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
  
end
