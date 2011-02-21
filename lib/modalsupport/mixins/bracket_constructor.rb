# Mixin that adds a [] operator constructor to a class, which
# is a not-so-ugly alternative to the +new+ method.
#
#   class A
#     include BracketConstructor
#     def initialize(a)
#       puts "A.new(#{a.inspect})"
#     end 
#   end
#
#   A[100] # => A.new(100)
#
# In Rails, this kind of constructor has an advantage over a function such as:
#
#   def A(*args)
#     A.new(*args)
#   end
#
# With the A[] notation we've referenced the class name via the constant A, 
# which in Rails brings in the declaration for A automatically, whereas the
# method A() won't be found unless the file which declares it is explicitely
# required.
#
module ModalSupport::BracketConstructor
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def [](*args)
      if args.size==1
        arg = args.first
        return nil if arg.nil?
        return arg if arg.kind_of?(self)
      end
      self.new(*args)
    end
  end
  
end
