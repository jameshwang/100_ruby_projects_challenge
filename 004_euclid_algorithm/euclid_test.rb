require 'minitest/autorun'
require_relative './euclid'

describe Euclid do
  it "should not be nil" do
    refute_nil Euclid.new
  end

  describe "#lowest_common_denominator" do
    [
      {m: 50, n: 15, answer: 5},
      {m: 7, n: 15, answer: 1},
      {m: 100, n: 15, answer: 5},
      {m: 15, n: 50, answer: 5},
      {m: 15, n: 7, answer: 1},
      {m: 7, n: 21, answer: 7},
      {m: 21, n: 7, answer: 7},
      {m: 1000, n: 3, answer: 1},
      {m: 544, n: 119, answer: 17},
    ].each do |cas|
      it "#{cas[:m]} and #{cas[:n]} should be #{cas[:answer]}" do
        assert_equal cas[:answer], Euclid.lowest_common_denominator(cas[:m], cas[:n])
      end
    end
  end
end
