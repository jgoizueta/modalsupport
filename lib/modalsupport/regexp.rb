class Regexp
 
  if_ruby_version :<, "1.9.0" do
    alias match_old match
    # Modify String#match to work as in Ruby 1.9
    def match(str, i=0)
      str = str[i..-1] if i>0
      m = self.match_old(str)
      if m && block_given?
        yield m
      else
        m
      end
    end    
  end
 
  # Pass each match to a block: string.match_all{|match_data| ...}
  def match_all(str)
    result = []
    i = 0
    while r=str.index(self, i)
      match = Regexp.last_match
      i = r + match.to_s.length
      result << yield(match)
    end
    result
  end

  # Pass the first match to a block: string.match_one{|match_data| ...}
  def match_one(str, i=0, &blk)
    match str, i, &blk
  end

end
