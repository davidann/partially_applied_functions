module PartiallyAppliedMethods
  def partially_applied_method(method_name, &block)
    arity = block.arity
    define_singleton_method(method_name) do |*args|
      _args = args
      if _args.count == arity
        block.call(*_args)
      else
        Proc.new do |*extra_args|
          current_args = _args
          current_args << extra_args
          block.call(*current_args) if current_args == args.arity
        end
      end

    end

  end
end
