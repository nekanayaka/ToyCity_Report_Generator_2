require 'json'

# Print today's date
time = Time.new
puts "Today's Date: " + time.inspect.split[0]

def setup_files
    path = File.join(File.dirname(__FILE__), '../data/products.json')
    file = File.read(path)
    products_hash = JSON.parse(file)
    report_file = File.new("report.txt", "w+")
end

# Print "Sales Report" in ascii art
def print_heading
	puts   " ____        _             ____                       _   
			/ ___|  __ _| | ___  ___  |  _ \ ___ _ __   ___  _ __| |_ 
			\___ \ / _` | |/ _ \/ __| | |_) / _ \ '_ \ / _ \| '__| __|
			 ___) | (_| | |  __/\__ \ |  _ <  __/ |_) | (_) | |  | |_ 
			|____/ \__,_|_|\___||___/ |_| \_\___| .__/ \___/|_|   \__|
	                                			|_|                   "
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
	
	# For each product in the data set:
		# Print the name of the toy
		# Print the retail price of the toy
		# Calculate and print the total number of purchases
		# Calculate and print the total amount of sales
		# Calculate and print the average price the toy sold for
		# Calculate and print the average discount (% or $) based off the average sales price
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
	
	# For each brand in the data set:
		# Print the name of the brand
		# Count and print the number of the brand's toys we stock
		# Calculate and print the average price of the brand's toys
		# Calculate and print the total sales volume of all the brand's toys combined
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
  setup_files # load, read, parse, and create the files
  create_report # create the report!
end

start # call start method to trigger report generation




