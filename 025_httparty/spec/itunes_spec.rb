require 'itunes'

describe Itunes do
  it "returns the top 25 songs" do
    expect(Itunes.new.top25).to be_kind_of(Array)
    expect(Itunes.new.top25.size).to be 25
  end
end
