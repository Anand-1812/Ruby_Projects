alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l','m', 
            'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'    
          ]

def convert(char, key, alphabet)
  if char == ' '
    return char
  end
  

  is_upper = (char == char.upcase)
  char = char.downcase
  idx = alphabet.find_index(char)
  return char unless idx

  cipher_indx = (idx+key) % alphabet.size
  new_char = alphabet[cipher_indx]
is_upper ? new_char.upcase : new_char
end

def ceaser_cipher(string, key, alphabet)
  key = key.to_i
  result = string.chars.map { |char| convert(char, key, alphabet) }
  result.join
end


puts "Enter the string: "
str = gets.chomp

puts "Enter the key for shifting: "
key = gets.chomp

puts "str is #{str}"

ciphered_str = ceaser_cipher(str, key, alphabet)
puts "The ciphered string is: #{ciphered_str}"
