require 'json'

# Print today's date
def print_date
  time = Time.new
  puts "Today's Date: " + time.inspect.split[0]
end

def setup_files
    path = File.join(File.dirname(__FILE__), '../data/products.json')
    file = File.read(path)
    $products_hash = JSON.parse(file)
    report_file = File.new("report.txt", "w+")
    $reports_file = File.open('report.txt','a')
end

# Print "Sales Report" in ascii art
def print_heading
	# 	puts " ____        _             ____                       _
	# / ___|  __ _| | ___  ___  |  _  ___ _ __   ___  _ __| |_
	# ___  / _` | |/ _ / __| | |_) / _  '_  / _ | '__| __|
	#  ___) | (_| | |  __/__  |  _ <  __/ |_) | (_) | |  | |_
	# |____/ __,_|_|___||___/ |_| ____| .__/ ___/|_|   __|
	#                                                 |_|"
	puts   " ____        _             ____                       _   "
	puts   "/ ___|  __ _| | ___  ___  |  _ \ ___ _ __   ___  _ __| |_ "
	puts   "\___ \ / _` | |/ _ \/ __| | |_) / _ \ '_ \ / _ \| '__| __|"
	puts   " ___) | (_| | |  __/\__ \ |  _ <  __/ |_) | (_) | |  | |_ "
	puts   "|____/ \__,_|_|\___||___/ |_| \_\___| .__/ \___/|_|   \__|"
	puts   "                         			|_|                   "
	$reports_file.write(" ____        _             ____                       _   " + "\n" +
		   				"/ ___|  __ _| | ___  ___  |  _ \ ___ _ __   ___  _ __| |_ " + "\n" +
		   				"\___ \ / _` | |/ _ \/ __| | |_) / _ \ '_ \ / _ \| '__| __|" + "\n" +
		   				" ___) | (_| | |  __/\__ \ |  _ <  __/ |_) | (_) | |  | |_ " + "\n" +
		   				"|____/ \__,_|_|\___||___/ |_| \_\___| .__/ \___/|_|   \__|" + "\n" +
		   				"                         			|_|                    " + "\n")

end

def make_products_section

	# Print "Products" in ascii art

	puts "                     _            _       "
	puts "                    | |          | |      "
	puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
	puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
	puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
	puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
	puts "| |                                       "
	puts "|_|                                       "

	$reports_file.write("                     _            _       " + "\n" +
		 				"                    | |          | |      " + "\n" +
		 				" _ __  _ __ ___   __| |_   _  ___| |_ ___ " + "\n" +
		 				"| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|" + "\n" +
		 				"| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\" + "\n" +
		 				"| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/" + "\n" +
		 				"| |                                       " + "\n" +
		 				"|_|                                       " + "\n")

	# For each product in the data set:
		# Print the name of the toy
		# Print the retail price of the toy
		# Calculate and print the total number of purchases
		# Calculate and print the total amount of sales
		# Calculate and print the average price the toy sold for
		# Calculate and print the average discount (% or $) based off the average sales price

    def products_data
      $products_hash["items"].each do |toy|
          # toy_result = calculate_products_data(toy)
          print_products_data(toy)
      end
    end

    def get_total_purchases(toy)
      total_purchases = 0
      total_purchases += toy['purchases'].length
      return total_purchases
    end

    def calculate_total_amount_of_sales(toy)
      total_price = 0
      toy["purchases"].each do |toy_purchase|
        total_price += toy_purchase["price"]
      end
      return total_price
    end

    def calculate_average_price(total_sales, total_purchases)
      return total_sales/total_purchases
    end

    def calculate_average_discount(toy, average_price)
      return toy["full-price"].to_f - average_price
    end

    def calculate_average_percentage(average_price, toy)
      return (100 - ((average_price * 100) / toy['full-price'].to_f)).round(2)
    end

    def print_products_data(toy)
      # all printing is here
      puts "Toy name: #{toy['title']}\n"
      $reports_file.write("Toy name: #{toy['title']}\n")
      puts "Total_purchases: #{get_total_purchases(toy)}\n"
      $reports_file.write("Total_purchases: #{get_total_purchases(toy)}\n")
      puts "Total sales: $#{calculate_total_amount_of_sales(toy)}\n"
      $reports_file.write("Total sales: $#{calculate_total_amount_of_sales(toy)}\n")
      puts "Average price the toy was sold for: $#{calculate_average_price(calculate_total_amount_of_sales(toy), get_total_purchases(toy))}\n"
      $reports_file.write("Average price the toy was sold for: $#{calculate_average_price(calculate_total_amount_of_sales(toy), get_total_purchases(toy))}\n")
      puts "Average discount: $#{calculate_average_discount(toy, calculate_average_price(calculate_total_amount_of_sales(toy), get_total_purchases(toy)))}\n"
      $reports_file.write("Average discount: $#{calculate_average_discount(toy, calculate_average_price(calculate_total_amount_of_sales(toy), get_total_purchases(toy)))}\n")
      puts "Average discount percentage: #{calculate_average_percentage(calculate_average_price(calculate_total_amount_of_sales(toy), get_total_purchases(toy)), toy)}%\n"
      $reports_file.write("Average discount percentage: #{calculate_average_percentage(calculate_average_price(calculate_total_amount_of_sales(toy), get_total_purchases(toy)), toy)}%\n\n")

    end

    products_data

end

def make_brands_section
	# Print "Brands" in ascii art

	puts " _                         _     "
		puts "| |                       | |    "
		puts "| |__  _ __ __ _ _ __   __| |___ "
		puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
		puts "| |_) | | | (_| | | | | (_| \\__ \\"
		puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
		puts

		$reports_file.write(" _                         _     " + "\n" +
			 				"| |                       | |    " + "\n" +
			 				"| |__  _ __ __ _ _ __   __| |___ " + "\n" +
			 				"| '_ \\| '__/ _` | '_ \\ / _` / __|" + "\n" +
			 				"| |_) | | | (_| | | | | (_| \\__ \\" + "\n" +
			 				"|_.__/|_|  \\__,_|_| |_|\\__,_|___/" + "\n")

	# For each brand in the data set:
		# Print the name of the brand
		# Count and print the number of the brand's toys we stock
		# Calculate and print the average price of the brand's toys
		# Calculate and print the total sales volume of all the brand's toys combined
	$k = 0
	while $k < $products_hash['items'].length  do

    def calculate_lego_product_price
      return (($products_hash['items'][0]['full-price'].to_f + $products_hash['items'][2]['full-price'].to_f)/2).round(2)
    end

    def calculate_lego_total_sales
      return (($products_hash['items'][0]['full-price'].to_f * $products_hash['items'][0]['purchases'].length - 1) +
	    ($products_hash['items'][2]['full-price'].to_f * $products_hash['items'][2]['purchases'].length - 1)).round(2)
    end

    def calculate_nano_product_price
      return $products_hash['items'][$k + 1]['full-price'].to_f / 1
    end

    def calculate_nano_total_sales
      return ($products_hash['items'][$k + 1]['full-price'].to_f * $products_hash['items'][$k + 1]['purchases'].length - 1)
    end

	  if $products_hash['items'][$k]['brand'] == "LEGO"
	    puts "\nBrand: #{$products_hash['items'][0]['brand']}"
	    $reports_file.write("\nBrand: #{$products_hash['items'][0]['brand']}" + "\n")
	    puts "Number of products: #{$products_hash['items'][0]['stock']}"
	    $reports_file.write("Number of products: #{$products_hash['items'][0]['stock']}" + "\n")
	    puts "Average product price: $#{calculate_lego_product_price}"
	    $reports_file.write("Average product price: $#{calculate_lego_product_price}" + "\n")
	    puts "Total sales: $#{calculate_lego_total_sales}"
	    $reports_file.write("Total sales: $#{calculate_lego_total_sales}" + "\n")
	  end
	  next if $k == 2
	  puts "\nBrand: #{$products_hash['items'][$k + 1]['brand']}"
	  $reports_file.write("\nBrand: #{$products_hash['items'][$k + 1]['brand']}" + "\n")
	  puts "Number of products: #{$products_hash['items'][$k + 1]['stock']}"
	  $reports_file.write("Number of products: #{$products_hash['items'][$k + 1]['stock']}" + "\n")
	  puts "Average product price: $#{calculate_nano_product_price}"
	  $reports_file.write("Average product price: $#{calculate_nano_product_price}" + "\n")
	  puts "Total sales: $#{calculate_nano_total_sales}"
	  $reports_file.write("Total sales: $#{calculate_nano_total_sales}" + "\n")
	  break if $products_hash['items'][$k]['brand'] == $products_hash['items'][$products_hash['items'].length - 1]['brand']
	  $k += 1
	end
	$reports_file.close
end

def print_data
	make_products_section
	make_brands_section
end

def create_report
	print_heading
	print_data
end

def start
  print_date
  setup_files # load, read, parse, and create the files
  create_report # create the report!
end

start # call start method to trigger report generation
