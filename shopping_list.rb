def printer(list)
  list.each do |item|
    item.each { |item, price| puts "#{item}: #{price}" }
    puts ""
  end
end

def contains_check(name, arr)
  exists = false
  arr.each do |element|
    if element.has_value?(name)
      exists = true
    end
  end
  exists
end

item_list = [
  {name: "apple", price: 0.99},
  {name: "orange", price: 0.99},
  {name: "cereal", price: 1.53},
  {name: "hot pockets", price: 5.99},
  {name: "2% milk", price: 1.65},
  {name: "20lb rice", price: 23.99},
  {name: "truffle", price: 450.27},
]

shopping_list = []

price_total = 0.0

puts "--Shopping List--"

while true
  puts "1) View my shopping list"
  puts "2) View available items"
  puts "3) Add item"
  puts "4) Remove item"
  puts "5) Proceed to checkout"

  input = $stdin.gets.strip.to_i

  case input
  when 1
    printer(shopping_list)
    puts "Your current total is #{price_total.round(2)}"
  when 2
    printer(item_list)
  when 3
    puts "Enter the name of the item to add to your list"

    item = $stdin.gets.strip

    if !contains_check(item, item_list)
      puts "That's not an option bro."
    else
      item_list.each_with_index do |element, i|
        if element[:name] == item
          shopping_list << item_list.delete_at(i)
          price_total += element[:price]
        end
      end
      puts "Your total is now #{price_total.round(2)}"
    end
  when 4
    puts "Enter the name of the item to remove from your list"

    item = $stdin.gets.strip

    if !contains_check(item, shopping_list)
      puts "That's not an option bro."
    else
      shopping_list.each_with_index do |element, i|
        if element[:name] == item
          item_list << shopping_list.delete_at(i)
          price_total -= element[:price]
        end
      end
      puts "Your total is now #{price_total.round(2)}"
    end
  when 5
    puts "Your total is #{price_total.round(2)}. Have a nice day!"
    exit 0
  else
    puts "Invalid input."
  end
end
