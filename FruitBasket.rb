require 'csv'

unless ARGV.length == 1 && ARGV[0].to_s == "basket.csv"
	puts "Exactly one argument (basket.csv) required."
	exit
end

basket = CSV.parse(File.read(ARGV[0].to_s), headers: true)

unless basket.headers == ["name","size","color","shape","days"]
	puts "basket.csv is not properly formatted. Headers must equal:\nname, size, color, shape, days"
	exit
end

totalFruits = 0

fruitTypes = Hash.new
fruitTypes.default = 0

fruitCharacter = Hash.new
fruitCharacter.default = 0

fruitOld = Hash.new
fruitOld.default = 0

basket.each do |row|
	curFruit = row['name']
	curCount = row['size'].to_i
	curColor = row['color']
	curShape = row['shape']
	curDays = row['days'].to_i
	
	# add to Total Fruit
	totalFruits += curCount

	# add to Current Fruit
	fruitTypes[curFruit] += curCount

	# add to Current Characteristics
	curCharacter = curFruit + "s: " + curShape + ", " + curColor
	fruitCharacter[curCharacter] += curCount.to_i

	# add to Current Old Fruit
	if curDays > 3
		fruitOld[curFruit] += curCount
	end
end

fruitTypes = fruitTypes.sort_by{|k, v| -v}

print "Total number of fruit: ",totalFruits,"\n\n"
print "Types of fruit: ",fruitTypes.length,"\n\n"
print "The number of each type of fruit in descending order\n\n"

fruitTypes.each do |row|
	print row[0],": ",row[1],"\n\n"
end

print "The characteristics (size, color, shape, etc.) of each fruit by type\n\n"

fruitCharacter.each do |row|
	print row[1]," ",row[0],"\n\n"
end

print "Have any fruit been in the basket over 3 days\n\n"

if fruitOld.empty?
	print "No fruits"
else
	i = 0 # If I had the each loop below pass an index, it screwed up the rest of the print statements in a way I couldn't find a solution to.

	fruitOld.each do |row|
		if i == fruitOld.length - 1
			print "and ",row[1]," ",row[0],"s"
		else
			print row[1]," ",row[0],"s, "
		end
		i += 1
	end
end
print " are over 3 days old"