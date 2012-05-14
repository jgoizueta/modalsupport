module ModalSupport

  module_function

  # Map hashes and arrays recursively. The supplied block is used to map all items (values and container).
  #
  # Examples
  #   # double numeric values
  #   recursive_map(:a=>11, :b=>22, :c=>{:x=>100,:y=>200}, :d=>[1,2,3]){|v| v.kind_of?(Numeric) ? v*2 : v}
  #   # => {:a=>22, :b=>44, :c=>{:x=>200,:y=>400}, :d=>[2,4,6]}
  #
  #   # convert hashes to OpenStructs
  #   recursive_map(:a=>11, :b=>22, :c=>{:x=>100,:y=>200}){|v| v.kind_of?(Hash) ? OpenStruct.new(v) : v}
  #   # => #<OpenStruct b=22, a=11, c=#<OpenStruct x=100, y=200>>
  def recursive_map(container, key=nil, &blk)
    raise ArgumentError, "recursive_map requires a block" if blk.nil?
    case container
    when Hash
      if blk.arity==2
        blk[key, container.map{|k,v|
          [k, recursive_map(v, k, &blk)]
        }.to_h]
      else
        blk[container.map{|k,v|
          [k, recursive_map(v, &blk)]
        }.to_h]
      end
    when Array
      if blk.arity==2
        blk[key, container.map_with_index{|v, i| recursive_map(v, i, &blk)}]
      else
        blk[container.map{|v| recursive_map(v, &blk)}]
      end
    else
      mapped = blk.arity==2 ?  blk[key, container] : blk[container]
      case mapped
      when Hash, Array
        recursive_map(mapped, key, &blk)
      else
        mapped
      end
    end
  end

end
