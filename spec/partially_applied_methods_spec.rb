require './lib/partially_applied_methods'
require 'rspec'

module Test
  class A
    extend PartiallyAppliedMethods

    partially_applied_method :f do |a, b|
      a + b
    end
  end
end

describe  Test::A do
  it "returns a method, with an arity of 1, if called with 1 of 2 arguments" do
    p_method = described_class.f(1)
    p_method.arity.should == 1
  end
  
  it "returns a method if called with 1 of 2 arguments" do
    p_method = described_class.f(1)
    p_method.should be_kind_of(Proc)
  end

  it "runs computes the method reslt if given all the arguments at once" do
    described_class.f(1,2).should == 3
  end

end

