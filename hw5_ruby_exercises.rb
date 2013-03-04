# Note: we're looking for Ruby commands for the below questions, not the actual answers, unless it's a question. 

# Hint: you can type "irb" in your terminal to get a Ruby console to test things out. For multi-line code, use an editor that can run Ruby code, or copy/paste into irb.

# Hint 2: you can refer to the Ruby doc for Array and Hash here: 

# http://www.ruby-doc.org/core-1.9.3/Array.html
# http://www.ruby-doc.org/core-1.9.3/Hash.html

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# 1. Use the "each" method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.

puts "Exercise 1"
a.each { |x| print x }
puts
puts
# 2. Same as above, but only print out values greater than 5.

puts "Exercise 2"
a.each { |x| print x if x > 5 }
puts
puts

# 3. Now, using the same array from #2, use the "select" method to extract all odd numbers into a new array.

puts "Exercise 3"
b = a.select { |x| x % 2 != 0 }
p b
puts

# 4. Append "11" to the end of the array. Prepend "0" to the beginning.

puts "Exercise 4"
b << 11
p b
b.unshift 0
p b
puts

# 5. Get rid of "11". And append a "3".

puts "Exercise 5"
b.pop
p b
b.push 3
p b
puts
puts

# 6. Get rid of duplicates without specifically removing any one value.

puts "Exercise 6"
b.uniq! # destructive (changed array)
p b
puts

# 7. What's the major difference between an Array and a Hash?

# ANSWER: Arrays are ordered by an index. Hashes are ordered by way of key-value pairs on a order is insertion order basis.

# 8. Create a Hash using both Ruby 1.8 and 1.9 syntax.

# QUESTION FOR LS: You mean different symbol notations? Hashes are created practically the same way.

puts "Exercise 8"
hash_18 = {:one => "uno", :two => "dos"}
hash_19 = {one: "uno", two: "dos"}

p hash_18 == hash_19
puts

# Suppose you have a h = {a:1, b:2, c:3, d:4}

h = {a:1, b:2, c:3, d:4}

# 9. Get the value of key "b".

puts "Exercise 9"
p h[:b]
puts

# 10. Add to this hash the key:value pair {e:5}

puts "Exercise 10"
h[:e] = 5
p h
puts

# 13. Remove all key:value pairs whose value is less than 3.5

puts "Exercise 13"
h.delete_if { |k,v| v < 3.5 }
p hash_18
puts

# 14. Can hash values be arrays? Can you have an array of hashes? (give examples)

puts "Exercise 14"
puts "Hash values can be arrays"
c = {a:[1, 2,3], b:[4,5,6]}
p c
puts

puts "Arrays can be composed of hashes"
d = [{a:1, b:2}, {c:3, d:4}]
p d
puts

# 15. Look at several Rails/Ruby online API sources and say which one your like best and why.
