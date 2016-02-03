require 'json'
require 'date'
# File path for products.json
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)
# Accessing products_hash "items"
items = products_hash["items"]
todays_date = Date.today

def print_line_break(lines)
	result = "-" * lines
	return result + "\n"
end

f = File.new("./report.txt", "w")
f.puts("Todays Date: #{todays_date}\n\n", "Products in Data set", print_line_break(25))
items.each { |report|
	f.print("Title: #{report['title']}\n", "Retail Price: #{report['full-price']}\n", "Average Sales Price: $#{(report['purchases'][0]['price'] + report['purchases'][1]['price']) / 2 }\n", "Discount: $#{(report['full-price']).to_f - ((report['purchases'][0]['price']) + (report['purchases'][1]['price'])) / 2}\n\n") }
f.close

# Print today's date
printf "Todays date: #{todays_date.strftime("%m/%d/%Y")}\n\n"
# For each product in the data set:
printf "Products in the Data Set\n"
printf print_line_break(25)
  # Print the name of the toy
	items.each { |x|
		printf "Title: " + x["title"] + "\n" + "Retail Price: $" + x["full-price"] + "\n" + "Average Sales Price: $" + "#{(x['purchases'][0]['price'] + x['purchases'][1]['price']) / 2 }" + "\n" + "Discount: $" + "%.2f\n\n","#{(x['full-price']).to_f - ((x['purchases'][0]['price']) + (x['purchases'][1]['price'])) / 2 }"
	}

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

  # Print the retail price of the toy
  # Calculate and print the total number of purchases
	printf print_line_break(35)
	printf "Total Sales: " + "#{total_num_of_sales.count}\n"
	# Calculate and print the total amount of sales
	printf "Total Amount of Sales: $" + "#{orders}\n"
	printf print_line_break(35)
	printf "\n\n"
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount (% or $) based off the average sales price

# For each brand in the data set:
average_retail_price = (items_retail_price1.to_f + items_retail_price2.to_f + items_retail_price3.to_f) / 3
  # Print the name of the brand
	printf "Brands in the Data Set\n"
	printf print_line_break(25)
	items.each { |x| printf "Brand: " + x['brand'] + "\n" + "In-Stock: " + x['stock'].to_s + "\n\n"}
	# Count and print the number of the brand's toys we stock
	printf print_line_break(35)
	printf "Total Brand's in Stock: " + (items[0]['stock'] + items[1]['stock']).to_s + "\n"
  # Calculate and print the average price of the brand's toys
	printf "Average Brand's Toy Price: $" + "%.2f" , "#{average_retail_price}\n"
  # Calculate and print the total revenue of all the brand's toy sales combined
	printf "\nTotal Amount of Sales: $" + "#{orders}\n"
  printf print_line_break(35)
