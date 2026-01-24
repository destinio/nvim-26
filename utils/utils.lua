-- Function to print a formatted name string
-- @param name string: The name to be printed
local printName = function(name)
  print("Name: " .. name)
end

-- Function to convert Celsius to Fahrenheit
-- @param celsius number: Temperature in Celsius
-- @return number: Temperature in Fahrenheit
local celsiusToFahrenheit = function(celsius)
  return (celsius * 9 / 5) + 32
end

-- Export the utility functions as a module
return {
  printName = printName,
  celsiusToFahrenheit = celsiusToFahrenheit
}
