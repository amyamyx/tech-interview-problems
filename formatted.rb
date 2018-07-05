# Well-formed String

# A string with the characters [,],{,},(,) is said to be
# well-formed if the different types of brackets match 
# n the correct order.

# For example, ([]){()} is well-formed, but [(]{)} is not.

# Write a function to test whether a string is well-formed.

def well_formed(str)
  left = ["{", "(", "["].to_set
  right = ["}", ")", "]"].to_set

  str.length.times do |i|
    return false if i == 0 && right.include?(str[i])
  end
end


p well_formed("[{[]}()]") == true
p well_formed("[(]{)}") == false