module Decorators
  class Base < SimpleDelegator
    alias_method :object, :__getobj__


    def ==(other)
      super || (other.is_a?(Decorators::Base) && super(other.object))
    end
  end
end
