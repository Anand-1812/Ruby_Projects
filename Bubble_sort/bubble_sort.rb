def bubble_sort(arr)
  (0...arr.length).each do |i|
    (0...arr.length-i-1).each do |j|
      if arr[j] > arr[j+1]
        arr[j], arr[j+1] = arr[j+1], arr[j]
      end
    end
  end
end

arr = []

loop do
  puts "Enter the element of array:"
  input = gets.chomp
  break if input.empty?
  arr.push(input.to_i)
end

bubble_sort(arr)
puts "Sorted array is #{arr}"
