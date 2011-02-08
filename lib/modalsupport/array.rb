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
end
