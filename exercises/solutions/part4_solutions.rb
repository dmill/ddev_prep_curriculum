def sum_to_num(num)
  sum = 0
  (1..num).each do |int|
    sum += int
  end

  sum
end

def fizzbuzz_array(arr)
  arr.map { |num| fizzbuzz(num) }
end

def fizzbuzz(num)
  if num % 15 == 0
    "fizzbuzz"
  elsif num % 3 == 0
    "fizz"
  elsif num % 5 == 0
    "buzz"
  else
    num
  end
end

def palindromes(arr)
  arr.select { |num| num.to_s.reverse == num.to_s }
end

def digit_sum(num)
  num.to_s.split("").reduce(0) { |sum, n| sum + n.to_i }
end
