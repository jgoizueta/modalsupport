# Mixin that adds a [] operator constructor to a class
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
