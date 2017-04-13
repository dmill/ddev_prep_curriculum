class Friend
  attr_reader :name

  def initialize(name = "Bob")
    @name = name
  end

  def greeting(name = nil)
    if name
      "Hello, #{name}!"
    else
      "Hello!"
    end
  end
end

class Book
  LOWER_WORDS = [
    "the",
    "a",
    "an",
    "and",
    "in",
    "of"
  ]

  attr_reader :title

  def title=(title)
    title_words = title.split(" ").map(&:downcase)

    new_words = title_words.map.with_index do |word, i|
      if LOWER_WORDS.include?(word) && i != 0
        word
      else
        word.capitalize
      end
    end

    @title = new_words.join(" ")
  end
end

class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end

  def time_string
    "#{padded(hours)}:#{padded(minutes)}:#{padded(minute_seconds)}"
  end

  private

  def padded(num)
    if num > 10
      "#{num}"
    else
      "0#{num}"
    end
  end

  def hours
    Integer(seconds / 3600)
  end

  def minutes
    Integer((seconds % 3600) / 60)
  end

  def minute_seconds
    Integer((seconds % 60))
  end
end

class Dictionary
  attr_reader :entries

  def initialize
    @entries = {}
  end

  def add(new_entries)
    if new_entries.is_a?(String)
      @entries[new_entries] = nil
    elsif new_entries.is_a?(Hash)
      @entries.merge!(new_entries)
    end
  end

  def find(fragment)
    @entries.select do |word, definition|
      word.match(fragment)
    end
  end

  def keywords
    @entries.keys.sort { |x, y| x <=> y }
  end

  def include?(word)
    @entries.has_key?(word)
  end

  def printable
    entries = keywords.map do |keyword|
      %Q{[#{keyword}] "#{@entries[keyword]}"}
    end

    entries.join("\n")
  end
end
