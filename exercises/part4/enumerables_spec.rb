require "./enumerables"

describe "#sum_to_num" do
  it "sums 1 to 1" do
    expect(sum_to_num(1)).to eq(1)
  end

  it "sums 2 to 3" do
    expect(sum_to_num(2)).to eq(3)
  end

  it "sums 3 to 6" do
    expect(sum_to_num(3)).to eq(6)
  end

  it "sums 17 to 153" do
    expect(sum_to_num(17)).to eq(153)
  end

  it "sums 1346 to 906531" do
    expect(sum_to_num(1346)).to eq(906531)
  end

  it "sums 487633 to 118893215161" do
    expect(sum_to_num(487633)).to eq(118893215161)
  end
end

describe "#palindromes" do
  it "counts single digit numbers" do
    expect(palindromes([1])).to eq([1])
  end

  it "excludes 15 and returns an empty array" do
    expect(palindromes([15])).to eq([])
  end

  it "selects the appropriate palindromes from an array" do
    expect(palindromes([555, 7889887, 43698, 77, 17])).to eq([555, 7889887, 77])
    expect(palindromes([360, 111, 50, 499, 10])).to eq([111])
  end

  it "returns an empty array when given an empty array" do
    expect(palindromes([])).to eq([])
  end
end

describe "#digit_sum" do
  it "sums 0 to 0" do
    expect(digit_sum(0)).to eq(0)
  end

  it "sums 86 to 14" do
    expect(digit_sum(86)).to eq(14)
  end

  it "sums 41 to 5" do
    expect(digit_sum(41)).to eq(5)
  end

  it "sums 902557 to 28" do
    expect(digit_sum(902557)).to eq(28)
  end

  it "sums 666666666666 to 72" do
    expect(digit_sum(666666666666)).to eq(72)
  end
end

describe "#fizzbuzz_array" do
  it "returns an empty for an empty array" do
    expect(fizzbuzz_array([])).to eq([])
  end

  it "handles repeated numbers" do
    expect(fizzbuzz_array([3, 3, 3, 5, 5])).to eq(["fizz", "fizz", "fizz", "buzz", "buzz"])
  end

  it "modifies the appropriate numbers and not the others" do
    expect(fizzbuzz_array([150, 16, 336, 275, 37])).to eq(["fizzbuzz", 16, "fizz", "buzz", 37])
  end
end
