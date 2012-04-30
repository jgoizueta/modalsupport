#   HoboSupport-style ._?
#   ._? calls a method if the receiver is not nil, returns nil
#   otherwise.
require 'singleton'

unless nil.respond_to?(:_?)

  class Object
    def _?()
      self
    end
  end

  class NilClass
    def _?()
      ModalSupport::SafeNil.instance
    end
  end

  module ModalSupport

    class SafeNil < ModalSupport::BasicObject
      include ::Singleton
      def method_missing(method, *args, &b)
        return nil
      end
    end

  end

end
