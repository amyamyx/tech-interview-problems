# Single Element in a Sorted Array

# Given a sorted array consisting of only integers where every
# element appears twice except for one element which appears once. 
# Find this single element that appears only once. Do it in O(logn)
# time and O(1) space!

def find_single(arr)
  upper = arr.length
  m = upper / 2
  ol = arr.length
  lower = 0

  while true
    return m if  m + 1 == ol || m == 0

    left_same =  arr[m] == arr[m - 1]
    right_same = arr[m] == arr[m + 1]

    return m unless left_same || right_same

    if (m.even? && left_same) || (m.odd? && right_same)
      upper = m
      m = (m - lower) / 2 + lower
    else
      lower = m
      m = m + (upper - m) / 2
    end
  end
end

# def find_single(arr)

#  while true
#     m = arr.length / 2
#    return m if arr.length == 1 || m + 1 == arr.length || m == 0
#    m = arr.length/2
#    left_same = arr[m-1] == arr[m]
#    right_same = arr[m + 1] == arr[m]
#    return m if !left_same && !right_same
#    if left_same
#      arr = arr[m + 1..-1] if m.odd?
#      arr = arr[0...m] if m.even?
#    end

#    if right_same
#      arr = arr[m + 1..-1] if m.even?
#      arr = arr[0...m] if m.odd?
#    end

#  end 
# end

p find_single([0,1,1,2,2,3,3 ,4,4,5,5,6,6]) == 0
p find_single([0,0,1,1,2,3,3 ,4,4,5,5,6,6]) == 4
p find_single([0,0,1,1,2,2,3 ,4,4,5,5,6,6]) == 6
p find_single([0,0,1,1,2,2,3 ,3,4,5,5,6,6]) == 8
p find_single([0,0,1,1,2,2,3 ,3,4,4,5,5,6]) == 12

p find_single([0,1,1,2,2,3 ,3,4,4,5,5]) == 0
p find_single([0,0,1,2,2,3 ,3,4,4,5,5]) == 2
p find_single([0,0,1,1,2,3 ,3,4,4,5,5]) == 4
p find_single([0,0,1,1,2,2 ,3,4,4,5,5]) == 6
p find_single([0,0,1,1,2,2 ,3,3,4,5,5]) == 8
p find_single([0,0,1,1,2,2 ,3,3,4,4,5]) == 10
