def stock_picker(stocks)
  maxpr = 0
  bestBuy = stocks[0]
  buy_day = 0
  sell_day = 0
  best_buy_day = 0
  
  (1...stocks.length).each do |i|
    if stocks[i] < bestBuy
      bestBuy = stocks[i]
      best_buy_day = i
    end

    if stocks[i]-bestBuy > maxpr
      maxpr = stocks[i]-bestBuy
      buy_day = best_buy_day
      sell_day = i
    end
  end
  [buy_day, sell_day]
end

stocks = []
loop do
  puts "Enter the price of stocks: "
  input = gets.chomp
  break if input.empty?
  stocks.push(input.to_i)
end

length = stocks.length

buy_day, sell_day = stock_picker(stocks)

puts "[#{buy_day}, #{sell_day}]"
