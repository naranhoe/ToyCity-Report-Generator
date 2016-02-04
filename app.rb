require 'json'
require 'date'
# File path for products.json
@path = File.join(File.dirname(__FILE__), '../data/products.json')
@file = File.read(@path)
@products_hash = JSON.parse(@file)

# Accessing products_hash "items"
@items = @products_hash["items"]
@todays_date = Date.today
@current_time = Time.now

# Local variables
@total_full_price = @items[0]["full-price"].to_f + @items[1]["full-price"].to_f + @items[2]["full-price"].to_f
@orders = (@items[0]["purchases"][0]["price"] + @items[0]["purchases"][1]["price"] + @items[1]["purchases"][0]["price"] + @items[1]["purchases"][1]["price"] + @items[2]["purchases"][0]["price"] + @items[2]["purchases"][1]["price"])
@total_num_of_sales = @items.each { |x| x['purchases'][0]['price'] }
@average_retail_price = (@total_full_price) / 3
@total_sales = @total_num_of_sales.count

# Print line breaks
def print_line_break(lines, char)
	result = char * lines
	return result + "\n"
end

def total_sales_count
	# Variables used while iterating through items array
	count_i = 0
	count_j = 1
	total_for_i = 0
	total_for_j = 0
	# Iterate through items array & add up total users found
	for i in @items
		total_for_i = i["purchases"][count_i]["user"].count
		total_for_i = total_for_i + 1
	end
	# Iterate through items array & add up total users found
	for j in @items
		total_for_j = j["purchases"][count_j]["user"].count
		total_for_j = total_for_j + 1
	end

	return total_for_i + total_for_j
end

f = File.new("./report.txt", "w")
f.puts("**** Sales Report ****\n", "Todays Date: #{@todays_date}\n", "Time:#{@current_time.strftime('%l:%M:%S %p')}\n\n", "Products", print_line_break(15, "-"))
@items.each { |product|
	f.puts("Title: #{product['title']}\n", "Retail Price: #{product['full-price']}\n", "Average Sales Price: $#{(product['purchases'][0]['price'] + product['purchases'][1]['price']) / 2 }\n", "Discount: $#{(product['full-price']).to_f - ((product['purchases'][0]['price']) + (product['purchases'][1]['price'])) / 2}\n\n" ) }
f.puts print_line_break(35, "-")
f.puts "Total Sales: " + "#{total_sales_count}"
f.puts "Total Amount of Sales: $" + "#{@orders}\n"
f.puts print_line_break(35, "-")
f.puts "\n\nBrands\n" + print_line_break(15, "-")

@items.each { |brand| f.print "Brand: #{brand['brand']}\n", "In-Stock: #{brand['stock']}\n\n"}
f.puts print_line_break(35, "-")
f.puts "Total Brand's in Stock: " + (@items[0]['stock'] + @items[1]['stock']).to_s + "\n"
f.printf "Average Brand's Toy Price: $#{@average_retail_price.round(2)}\n"
f.puts "\nTotal Amount of Sales: $" + "#{@orders}\n"
f.puts print_line_break(35, "-")
f.close

# Print today's date
printf "Todays date: #{@todays_date.strftime("%m/%d/%Y")}\n"
printf "Time:#{@current_time.strftime('%l:%M:%S %p')}\n\n"
# For each product in the data set:
printf "Products\n"
printf print_line_break(15, "-")
  # Print the name of the toy
	@items.each { |product|
		printf "Title: " + product["title"] + "\n" + "Retail Price: $" + product["full-price"] + "\n" + "Average Sales Price: $" + "#{(product['purchases'][0]['price'] + product['purchases'][1]['price']) / 2 }" + "\n" + "Discount: $" + "%.2f\n\n","#{(product['full-price']).to_f - ((product['purchases'][0]['price']) + (product['purchases'][1]['price'])) / 2 }"
	}
	printf print_line_break(35, "-")
	printf "Total Sales: " + "#{total_sales_count}\n"
	printf "Total Amount of Sales: $" + "#{@orders}\n"
	printf print_line_break(35, "-")
	printf "\n\n"
	printf "Brands\n"
	printf print_line_break(15, "-")
	@items.each { |brand| printf "Brand: " + brand['brand'] + "\n" + "In-Stock: " + brand['stock'].to_s + "\n\n"}
	printf print_line_break(35, "-")
	printf "Total Brand's in Stock: " + (@items[0]['stock'] + @items[1]['stock']).to_s + "\n"
	printf "Average Brand's Toy Price: $#{@average_retail_price.round(2)}\n"
	printf "\nTotal Amount of Sales: $" + "#{@orders}\n"
  printf print_line_break(35, "-")
