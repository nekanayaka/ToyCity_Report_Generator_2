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
      puts "Average discount percentage: #{calculate_average_percentage(calculate_average_price(calculate_total_amount_of_sales(toy), get_total_purchases(toy)), toy)}%\n\n"
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

	def get_prices(brand)
	  prices = []
	  $products_hash["items"].each do |item|
	    item["purchases"].each do |purchase|
  	    if verify_brand?(brand, item)
  	     prices << purchase["price"]
  	    end
  	  end
	  end
	  prices
	end
	
	def get_retail_prices(brand)
	  retail_prices = []
	  $products_hash["items"].each do |item|
	    if verify_brand?(brand, item)
	     retail_prices << item["full-price"].to_f
	    end
  	end
	  retail_prices
	end
	
	def get_stock(brand)
    stock = 0
    $products_hash["items"].each do |item|
      if verify_brand?(brand, item)
        stock += item["stock"]
      end
    end
    stock
  end
	
	def get_total_price(prices)
	  total_price = 0
	  prices.each do |price|
	    total_price += price
	  end
	  total_price
	end
	
	def get_total_retail_prices(retail_prices)
	  total_price = 0
	  retail_prices.each do |price|
	    total_price += price
	  end
	  total_price
	end
	
	def verify_brand?(brand, toy)
	  toy["brand"] == brand
	end
	
	def get_brand
	  toy_brands = []
	  $products_hash["items"].each do |item|
	    toy_brands << item["brand"]
	  end
	  toy_brands.uniq!
	end
	
	def average_price(total_price, prices)
	  average_price = 0
	  average_price = (total_price/prices.length).round(2)
	  average_price
	end
	
	def brands_data
    toy_brand = get_brand
    toy_brand.each do |brand|
      puts "Brand: #{brand}\n"
      $reports_file.write("Brand: #{brand}\n")
      prices = get_prices(brand)
      total_stock = get_stock(brand)
      retail_prices = get_retail_prices(brand)
      puts "Stock: #{total_stock}\n"
      $reports_file.write("Stock: #{total_stock}\n")
      puts "Average price: #{average_price(get_total_retail_prices(prices), prices)}\n"
      $reports_file.write("Average price: #{average_price(get_total_retail_prices(prices), prices)}\n")
      puts "Total sales: #{get_total_price(prices).round(2)}\n\n"
      $reports_file.write("Total sales: #{get_total_price(prices).round(2)}\n\n")
    end
  end
  brands_data
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
