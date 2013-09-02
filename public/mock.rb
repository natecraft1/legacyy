# LastName FirstName MiddleInitial Gender DateOfBirth FavoriteColor

def get_data1
	data1 = File.read("mockchallenge.txt")
	arr = []
	split = data1.each_line { |line|  arr << line.split(" ") }
	gender = arr.sort_by { |x| x[3] }
	marr = []
	farr = []
	gender.each { |x| if x[3] == "M" then marr << x else farr << x end }
	sortedmarr = marr.sort_by { |x| x[0] }
	sortedfarr = farr.sort_by { |x| x[0] }
	answer = sortedfarr << sortedmarr
	print answer
end

# LastName, FirstName, Gender, FavoriteColor, DateOfBirth

def get_data2
	data2 = File.read("mockchallenge2.txt")
	arr = []
	split = data2.each_line { |line|  arr << line.split(", ") }
	gender = arr.sort_by { |x| x[2] }
	marr = []
	farr = []
	gender.each { |x| if x[2] == "Male" then marr << x else farr << x end }
	sortedmarr = marr.sort_by { |x| x[0] }
	sortedfarr = farr.sort_by { |x| x[0] }
	answer = sortedfarr << sortedmarr
	print answer
	
end

# LastName | FirstName | MiddleInitial | Gender | FavoriteColor | DateOfBirth
def get_data3
	data3 = File.read("mockchallenge3.txt")
	arr = []
	split = data3.each_line { |line|  arr << line.split(" | ") }
	gender = arr.sort_by { |x| x[3] }
	marr = []
	farr = []
	gender.each { |x| if x[3] == "M" then marr << x else farr << x end }
	sortedmarr = marr.sort_by { |x| x[0] }
	sortedfarr = farr.sort_by { |x| x[0] }
	answer = sortedfarr << sortedmarr
	print answer
end

get_data3
puts "__________________________________________"

# get_data2

# Create and display 3 different views of the recordset (see a sample here):
# Output 1 – sorted by gender (females before males) then by last name ascending.
# Output 2 – sorted by birth date, ascending.
# Output 3 – sorted by last name, descending.
# Ensure that fields are displayed in the following order: last name, first name, gender, date of birth, favorite color.
# Display dates in the format MM/DD/YYYY.