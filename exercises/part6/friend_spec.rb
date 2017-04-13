require "./friend"

describe Friend do
  it "says hello" do
    expect(Friend.new.greeting).to eq("Hello!")
  end

  it "says hello to someone" do
    expect(Friend.new.greeting("Bob")).to eq("Hello, Bob!")
  end
end
