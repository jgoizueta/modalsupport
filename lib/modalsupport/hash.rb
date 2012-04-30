unless defined? ::HoboSupport

  class Hash

    def map_hash(&b)
      res = {}
      each {|k,v| res[k] = b.arity == 1 ? yield(v) : yield(k, v) }
      res
    end

  end


end
