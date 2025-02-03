def substring(word, dictionaries)
  result = Hash.new(0)
  word.downcase!
  dictionaries.each do |str|
    count = word.scan(str).length
    result[str] = count if count > 0
  end
  puts result
  end

puts "Enter the word: "
word = gets.chomp

array = []
loop do
  puts "Enter the word in dictionaries: "
  input = gets.chomp
  break if input.empty?
  array.push(input)
end

puts array

substring(word, array)
