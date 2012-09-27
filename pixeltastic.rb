require './lib/logger'
require './lib/command'
require './lib/document'
require './lib/input'
require './lib/matrix'

# Run test scripts
Logger.level = 3
Input.run("I 5 6", "L 2 3 C", "S")
Logger.log("\n")
Input.run("I 5 6", "L 2 3 C", "F 3 3 J", "V 2 3 4 W", "H 3 4 2 Z", "S")

# Run the command line app
Logger.info("Enter a commmand:")
Input.new