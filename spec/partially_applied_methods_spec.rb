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
  it "returns a methods if called with 1 of 2 arguments" do
    described_class.f(1).should be_kind_of(Function)
  end
end

