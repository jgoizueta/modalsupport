module ModalSupport
  if defined? ActiveSupport::BasicObject
    BasicObject = ActiveSupport::BasicObject
  elsif defined? ::BasicObject
    class BasicObject < ::BasicObject
      undef_method :==
      undef_method :equal?
      def raise(*args)
        ::Object.send(:raise, *args)
      end
    end
  else
    class BasicObject #:nodoc:
      begin
        old_verbose, $VERBOSE = $VERBOSE, nil   # just like Rails silence_warnings: suppress "warning: undefining `object_id' may cause serious problem"
        instance_methods.each do |m|
          undef_method(m) if m.to_s !~ /(?:^__|^nil\?$|^send$|^object_id$)/
        end
      ensure
        $VERBOSE = old_verbose
      end
    end
  end
end
