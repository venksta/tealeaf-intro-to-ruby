# Note: we're looking for Ruby commands for the below questions, not the actual answers, unless it's a question. 

# Hint: you can type "irb" in your terminal to get a Ruby console to test things out. For multi-line code, use an editor that can run Ruby code, or copy/paste into irb.

# Hint 2: you can refer to the Ruby doc for Array and Hash here: 

# http://www.ruby-doc.org/core-1.9.3/Array.html
# http://www.ruby-doc.org/core-1.9.3/Hash.html

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# 1. Use the "each" method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.

puts "exercise 1"
a.each { |x| print x }
puts
puts

# 2. Same as above, but only print out values greater than 5.

puts "exercise 2"
a.each { |x| print x if x > 5 }
puts
puts

# 3. Now, using the same array from #2, use the "select" method to extract all odd numbers into a new array.

puts "exercise 3"
b = a.select { |x| x % 2 != 0 }
p b
puts
puts

# 4. Append "11" to the end of the array. Prepend "0" to the beginning.

puts "exercise 4"
b << 11
p b
b.unshift 0
p b
puts
puts

# 5. Get rid of "11". And append a "3".

puts "exercise 5"
b.pop
p b
b.push 3
p b
puts
puts

# 6. Get rid of duplicates without specifically removing any one value.

puts "exercise 6"
b.uniq! # destructive (changed array)
p b
puts
puts

# 7. What's the major difference between an Array and a Hash?

# 8. Create a Hash using both Ruby 1.8 and 1.9 syntax.

# Suppose you have a h = {a:1, b:2, c:3, d:4}

# 9. Get the value of key "b".

# 10. Add to this hash the key:value pair {e:5}

# 13. Remove all key:value pairs whose value is less than 3.5

# 14. Can hash values be arrays? Can you have an array of hashes? (give examples)

# 15. Look at several Rails/Ruby online API sources and say which one your like best and why.
