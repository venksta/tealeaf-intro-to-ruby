print "Input a number: "
num1 = gets.chomp

print "Input a second number: "
num2 = gets.chomp

puts "Input the number for the intended operation"
puts "(1) addition, (2) substraction, (3) multiplication and (4) division"
operator = gets.chomp

case operator
when "1"
  puts "Result: #{(num1.to_f + num2.to_f)}"
when "2"
  puts "Result: #{num1.to_f - num2.to_f}"
when "3"
  puts "Result: #{num1.to_f * num2.to_f}"
when "4"
  puts "Result: #{num1.to_f / num2.to_f}"
end