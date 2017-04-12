def factors(num)
  factors = []

  (1..num).each do |i|
    if num % i == 0
      factors << i
    end
  end

  factors
end

class Array
  def bubble_sort!
    # Without a proc
    sorted = false
    until sorted
      sorted = true

      each_index do |i|
        next if i + 1 == self.length
        j = i + 1
        if self[i] > self[j]
          sorted = false
          self[i], self[j] = self[j], self[i]
        end
      end
    end

    self
  end

  def bubble_sort!(&prc)
    # With a proc
    prc ||= Proc.new { |x, y| x <=> y }

    sorted = false
    until sorted
      sorted = true

      each_index do |i|
        next if i + 1 == self.length
        j = i + 1
        if prc.call(self[i], self[j]) == 1
          sorted = false
          self[i], self[j] = self[j], self[i]
        end
      end
    end

    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end
end

def substrings(string)
  subs = []

  string.length.times do |sub_start|
    ((sub_start)...(string.length)).each do |sub_end|
      sub = string[sub_start..sub_end]

      subs << sub unless subs.include?(sub)
    end
  end

  subs
end

def subwords(word, dictionary)
  substrings(word).select do |substr|
    dictionary.include?(substr)
  end
end

def doubler(array)
  array.map { |num| num * 2 }
end

class Array
  def my_each(&prc)
    i = 0

    while i < self.count
      prc.call(self[i])
      i += 1
    end

    self
  end

  def my_map(&prc)
    result = []
    my_each { |el| result << prc.call(el) }
    result
  end

  def my_select(&prc)
    result = []
    my_each { |el| result << el if prc.call(el) }
    result
  end

  def my_inject(&blk)
    val = self.first
    self.drop(1).my_each { |el| val = blk.call(val, el) }
    val
  end
end

def concatenate(strings)
  strings.inject("") do |total, string|
    # notice that I don't reassign `total`; that would be superfluous
    # since total is a local parameter to the block. I don't modify it
    # either, I just return the value to use for the next iteration.
    total + string
  end
end
