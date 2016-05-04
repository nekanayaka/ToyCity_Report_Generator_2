require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print "Sales Report" in ascii art

puts " _________      .__                  __________                             __   
 /   _____/____  |  |   ____   ______ \______   \ ____ ______   ____________/  |_ 
 \_____  \\__  \ |  | _/ __ \ /  ___/  |       _// __ \\____ \ /  _ \_  __ \   __\
 /        \/ __ \|  |_\  ___/ \___ \   |    |   \  ___/|  |_> >  <_> )  | \/|  |  
/_______  (____  /____/\___  >____  >  |____|_  /\___  >   __/ \____/|__|   |__|  
        \/     \/          \/     \/          \/     \/|__|                       "

# Print today's date

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
