class Regexp
 
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
  # Similar to Ruby 1.9 match, but does not set the special varialbes $~, $1, etc. in the caller's space.
  def match_one(str, i=0)
    str = str[i..-1] if i>0
    m = self.match(str)
    if m && block_given?
      yield m
    else
      m
    end
  end

end
