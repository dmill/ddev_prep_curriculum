# Enumerables

## What are Enumerables?

In Ruby, Enumerables are types of data that are made up of finite sets of other objects. The most common types of enumerable objects you'll encounter are:

**The Array**

```ruby
[1, 2, 3, 4, 5]

["one", "two", "three", "four", "five"]

[[0, 0], [0, 1], [1, 0], [1, 1]]
```

**The Hash**

```ruby
{a: "a", b: "b", c: "c"}

{"a" => ["armadillo", "aardvark", "alligator"], "b" => ["bat", "baracuda", "bonobo"]}

{1 => "one", 2 => "two", 3 => "three"}
```

**The String**

```ruby
"This is a string"

'Destination: Dev'

<<DOC
This is also a string in Ruby, called a heredoc.


  Heredocs allow you to write strings that span multiple lines and include space, tabs, and other formatting.

They begin and end with the delimeters you see here.
DOC

```

**The Range**

```ruby
(1..100)

("a"..."z")

(-10..-1)
```

When "enumerating" or "iterating" over each item in any of the enumerables above in Ruby, we generally prefer to use functional "Enumerable Methods" instead of while or for loops. The most basic enumerable method is `.each`. `.each` works like this:

```ruby
[1, 2, 3, 4, 5].each do |num|
  puts num
end

```
In the example above, `.each` will pass each number in the array into the "block" between the `do` and `end` keywords. Each item will get assigned to the local variable in between the `| |`, and then you can put code inside the block to do something with each value before moving on to the next one. You can check out all of the built-in enumerable methods in Ruby here:

<http://ruby-doc.org/core-2.4.0/Enumerable.html>

## Readings

### Code Academy: Lessons 5-7

Please go over the next sections in Code Academy if you haven't already done so.

<https://www.codecademy.com/learn/ruby>


### Launch School

Check out the launch school Ruby Guide's sections on Iteration, Arrays, and Hashes:

<https://launchschool.com/books/ruby/read/loops_iterators#iterators>

<https://launchschool.com/books/ruby/read/arrays#whatisanarray>

<https://launchschool.com/books/ruby/read/hashes#whatisahash>

Some of this is review, which you can skim if you're comfortable with it. Pay close attention to the sections on iterators, though, as they are highly relevant to the discussion here. Make sure to do the exercises too!

### Bastard's Book of Ruby

Go over the section on enumerables:

<http://ruby.bastardsbook.com/chapters/enumerables/>

# Gems

In order to gear you up for the exercises you're going to get into in this section, let's do a brief introduction to gems in Ruby. In Ruby, gems are self-contained software libraries that you can include in your projects. Ruby gems are generally associated with open-source software, and even one of the most important tools we'll use later in this course, Ruby on Rails, will be included in your projects as a gem. Gems don't have to be open-source, though, and many companies have their own internal closed source gems. You can check out all of the publicly available gems from the biggest repository on the internet, <https://rubygems.org/>.

To get a bit more background on what gems are and how they work, read the sections in the Launch School guide to Ruby tools on gems and bundler:

<https://launchschool.com/books/core_ruby_tools/read/gems>

<https://launchschool.com/books/core_ruby_tools/read/bundler>

# RSpec

RSpec is a testing framework that allows us to test our code in an easily readable format. We'll be using RSpec to test our code here, and you're going to use it a lot more in Destination: Dev as well as on the job as a professional developer. Check out this awesome introduction to RSpec to learn more about the philosophy behind this testing framework and why we use it:

<https://semaphoreci.com/community/tutorials/getting-started-with-rspec>

# Exercises

Okay, now we're ready to get going on some exercies in order to get some practice with some enumerable methods and to test out RSpec. So go ahead and hop over to the Cloud9 workspace you created


