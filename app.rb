require 'json'
require 'date'
# File path for products.json
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Accessing products_hash "items"
items = products_hash["items"]
todays_date = Date.today
current_time = Time.now

# Local variables
total_full_price = items[0]["full-price"].to_f + items[1]["full-price"].to_f + items[2]["full-price"].to_f
orders = (items[0]["purchases"][0]["price"] + items[0]["purchases"][1]["price"] + items[1]["purchases"][0]["price"] + items[1]["purchases"][1]["price"] + items[2]["purchases"][0]["price"] + items[2]["purchases"][1]["price"])
total_num_of_sales = items.each { |x| x['purchases'][0]['price'] }
average_retail_price = (total_full_price) / 3
total_sales = total_num_of_sales.count

# Print line breaks
def print_line_break(lines, char)
	result = char * lines
	return result + "\n"
end

# Print today's date & time
printf "Todays date: #{todays_date.strftime("%m/%d/%Y")}\n"
printf "Time:#{current_time.strftime('%l:%M:%S %p')}\n\n"
# For each product in the data set:
printf "Products\n"
printf print_line_break(15, "-")
# Variables used while iterating through items array
count_i = 0
count_j = 1
total_for_i = 0
total_for_j = 0
# Iterate through items array & add up total users found
for i in items
	total_for_i = i["purchases"][count_i]["user"].count
	total_for_i = total_for_i + 1
end
# Iterate through items array & add up total users found
for j in items
	total_for_j = j["purchases"][count_j]["user"].count
	total_for_j = total_for_j + 1
end

items.each { |product|
	printf "Title: " + product["title"] + "\n" + "Retail Price: $" + product["full-price"] + "\n" + "Average Sales Price: $" + "#{(product['purchases'][0]['price'] + product['purchases'][1]['price']) / 2 }" + "\n" + "Discount: $" + "%.2f\n\n","#{(product['full-price']).to_f - ((product['purchases'][0]['price']) + (product['purchases'][1]['price'])) / 2 }"
}
	printf print_line_break(35, "-")
	printf "Total Sales: " + "#{total_for_i + total_for_j}\n"
	printf "Total Amount of Sales: $" + "#{orders}\n"
	printf print_line_break(35, "-")
	printf "\n\n"
	printf "Brands\n"
	printf print_line_break(15, "-")

	items.each { |brand| printf "Brand: " + brand['brand'] + "\n" + "In-Stock: " + brand['stock'].to_s + "\n\n"}
	printf print_line_break(35, "-")
	printf "Total Brand's in Stock: " + (items[0]['stock'] + items[1]['stock']).to_s + "\n"
	printf "Average Brand's Toy Price: $" + "%.2f" , "#{average_retail_price}\n"
	printf "\nTotal Amount of Sales: $" + "#{orders}\n"
  printf print_line_break(35, "-")
