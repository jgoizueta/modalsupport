class String

  if_ruby_version :<, "1.9" do
    alias match_old match
    # Modify String#match to work as in Ruby 1.9
    def match(re, i=0)
      str = i>0 ? self[i..-1] : self
      m = str.match_old(re)
      if m && block_given?
        yield m
      else
        m
      end
    end    
  end

  # Pass each match to a block: string.match_all{|match_data| ...}; returns array of block results
  def match_all(re, i=0)
    result = []
    while r=self.index(re, i)
      match = Regexp.last_match
      i = r + match.to_s.length
      result << yield(match)
    end
    result
  end
 
  # Pass the first match to a block: string.match_one{|match_data| ...}; returns the block result
  def match_one(re, i=0, &blk)
    match re, i, &blk
  end

  # For each substitution, pass the match data to a block that should return substitution value
  def gsub_each(pattern)
    gsub(pattern){|str| yield(Regexp.last_match)}
  end
 
  # Mutable version of gsub_each
  def gsub_each!(pattern)
    gsub!(pattern){|str| yield(Regexp.last_match)}
  end
 
end



class String
  
  # Remove indentation of a string (or replace by the indentation defined by the parameters)
  def unindent(indent=nil)
    txt = self.gsub(/\t/, ' '*8)
    mx = txt.scan(/^ *[^\n\r]/).flatten.map{|s| s[-1,1]==' ' ? nil : (s.size-1)}.compact.min
    if mx && mx>0
      re = Regexp.new('^ {1,'+mx.to_s+"}")
      txt.gsub!(/^ {1,#{mx}}/, "")
    end
    lines = txt.split(/\r?\n/)
    if lines.first.strip.empty? || lines.last.strip.empty?
      lines.shift while lines.first.strip.empty?
      lines.pop while lines.last.strip.empty?
    end
    if indent
      indent = " "*indent if indent.kind_of?(Numeric)
      lines = lines.map{|line| "#{indent}#{line}"}
    end
    lines.join("\n")
  end
  
end

