module Enumerable

  def grep_each(pattern)
    grep(pattern){|str| yield(Regexp.last_match)}
  end
 
end
