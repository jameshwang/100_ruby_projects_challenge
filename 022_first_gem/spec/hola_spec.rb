require 'hola'

describe Hola do
  it "says 'hello world' for english" do
    expect(Hola.hi("english")).to eq 'hello world'
  end

  it "says 'hello world' as a default" do
    expect(Hola.hi).to eq 'hello world'
  end

  it "says 'hola mundo' for spanish" do
    expect(Hola.hi("spanish")).to eq 'hola mundo'
  end

  it "says 'bonjour' for french" do
    expect(Hola.hi("french")).to eq 'bonjour'
  end
end
