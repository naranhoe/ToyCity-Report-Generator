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
items_retail_price1 = items[0]["full-price"]
items_retail_price2 = items[1]["full-price"]
items_retail_price3 = items[2]["full-price"]
orders = items[0]["purchases"][0]["price"]
			 + items[0]["purchases"][1]["price"]
			 + items[1]["purchases"][0]["price"]
			 + items[1]["purchases"][1]["price"]
			 + items[2]["purchases"][0]["price"]
			 + items[2]["purchases"][1]["price"]
total_num_of_sales = items.each {|x| x['purchases'][0]['price']}
average_retail_price = (items_retail_price1.to_f + items_retail_price2.to_f + items_retail_price3.to_f) / 3
total_sales = total_num_of_sales.count

# Print line braks
def print_line_break(lines, char)
	result = char * lines
	return result + "\n"
end

# Write to file
f = File.new("./report.txt", "w")
f.puts("**** Sales Report ****\n", "Todays Date: #{todays_date}\n", "Time:#{current_time.strftime('%l:%M:%S %p')}\n\n", "Products", print_line_break(15, "-"))
# Iterate through items array
items.each { |product|
	# Local variables
	title = product['title']
	retail_price = product['full-price']
	avg_sales_price = (product['purchases'][0]['price'] + product['purchases'][1]['price']) / 2
	discount = (product['full-price']).to_f - ((product['purchases'][0]['price']) + (product['purchases'][1]['price'])) / 2
	f.print("Title: #{title}\n", "Retail Price: $#{retail_price}\n", "Average Sales Price: $#{avg_sales_price}\n", "Discount: $#{format("%.2f", discount)}\n\n" ) }

# Bottom part of the products report
f.puts print_line_break(35, "-")
f.puts "Total Sales: " + "#{total_sales}\n"
f.puts "Total Amount of Sales: $" + "#{orders}\n"
f.puts print_line_break(35, "-")
f.puts "\n\nBrands\n" + print_line_break(15, "-")

# Iterate through items array
items.each { |brand| f.print "Brand: #{brand['brand']}\n", "In-Stock: #{brand['stock']}\n\n"}
f.puts print_line_break(35, "-")
f.puts "Total Brand's in Stock: " + (items[0]['stock'] + items[1]['stock']).to_s + "\n"
f.printf "Average Brand's Toy Price: $" + "%.2f" , "#{average_retail_price}\n"
f.puts "\nTotal Amount of Sales: $" + "#{orders}\n"
f.puts print_line_break(35, "-")
f.close

# # Print today's date
# printf "Todays date: #{todays_date.strftime("%m/%d/%Y")}\n\n"
# # For each product in the data set:
# printf "Products in the Data Set\n"
# printf print_line_break(25, "-")
#   # Print the name of the toy
# 	items.each { |x|
# 		printf "Title: " + x["title"] + "\n" + "Retail Price: $" + x["full-price"] + "\n" + "Average Sales Price: $" + "#{(x['purchases'][0]['price'] + x['purchases'][1]['price']) / 2 }" + "\n" + "Discount: $" + "%.2f\n\n","#{(x['full-price']).to_f - ((x['purchases'][0]['price']) + (x['purchases'][1]['price'])) / 2 }"
# 	}
#
#   # Print the retail price of the toy
#   # Calculate and print the total number of purchases
# 	printf print_line_break(35, "-")
# 	printf "Total Sales: " + "#{total_num_of_sales.count}\n"
# 	# Calculate and print the total amount of sales
# 	printf "Total Amount of Sales: $" + "#{orders}\n"
# 	printf print_line_break(35, "-")
# 	printf "\n\n"
#   # Calculate and print the average price the toy sold for
#   # Calculate and print the average discount (% or $) based off the average sales price
#
# # For each brand in the data set:
#   # Print the name of the brand
# 	printf "Brands in the Data Set\n"
# 	printf print_line_break(25, "-")
# 	items.each { |x| printf "Brand: " + x['brand'] + "\n" + "In-Stock: " + x['stock'].to_s + "\n\n"}
# 	# Count and print the number of the brand's toys we stock
# 	printf print_line_break(35, "-")
# 	printf "Total Brand's in Stock: " + (items[0]['stock'] + items[1]['stock']).to_s + "\n"
#   # Calculate and print the average price of the brand's toys
# 	printf "Average Brand's Toy Price: $" + "%.2f" , "#{average_retail_price}\n"
#   # Calculate and print the total revenue of all the brand's toy sales combined
# 	printf "\nTotal Amount of Sales: $" + "#{orders}\n"
#   printf print_line_break(35, "-")
