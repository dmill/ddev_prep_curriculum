=begin

Here you're going to see some familiar problems from the DDev Introduction to Programming.
However, this time solve each problem with the suggested Enumerable method instead of a
loop or some other strategy.
=end


=begin

Sum to Num

Write a method, sum_to_num, that takes a positive integer as an argument and returns the sum
of every positive integer up to and including that number.

Example:

sum_to_num(3) == 6 ----> 1 + 2 + 3 = 6
=end

#solve using the Enumerable#each method
def sum_to_num(num)

end


# Fizz Buzz Array
#
# You remember fizzbuzz, right? Same logic as before, but this time
# you're going to get an entire array of integers. If the number
# passed in is divisible by 3, the method should return the
# string "fizz".If the number is divisible by 5, the method should return the
# string "buzz". If the number is divisible by both 3 and 5, the
# method should return the string "fizzbuzz". Finally, if the
# number is not divisible by either number it should return the
# number. Return an array with each number changed to it's fizzbuzz alternative.

#solve using Enumerable#map
def fizzbuzz_array(arr)

end

# Palindromes
#
# Write a method, palindromes, that accepts an array of numbers as an argument and returns
# an array of only the numbers that are palindromes. Palindromes are numbers that are the
# same forward and backward. Numbers in the returned array should be in the same order as
# in the original array.
#
# For Example:
#
# 101 is the same forward and backward. It is a palindrome.
# 102 is 201 backwards; it is not a palindrome.

#solve using Enumerable#select
def palindromes(arr)

end

# Sum of Digits
#
# Write a method, digit_sum, that takes an integer as input and returns the sum of
# its digits.
#
# Example:
# 245 => 2 + 4 + 5 => 11
# 670 => 6 + 7 + 0 => 13

#solve using Enumerable#reduce
def digit_sum(num)

end




