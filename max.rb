arr1 = [1, 2]
arr2 = [3, 1, 2, 2.5, 4]


def max(arr)
	arr.each_with_index do |x, i|
		currentmax = x
			arr.each do |y|
				compare(currentmax, y)
			end
			compare(currentmax, arr[i + 2])
	  end
end
def compare(a, b)
	if a > b
		return true;
	end
end

max(arr2)