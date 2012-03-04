require 'design-pattern'
require 'design-pattern-registry'

#==============================================================================
# Functions
#==============================================================================

# Quiz the user
def do_quiz(registry)
  sep = '----------' * 8
  
  # Get an array of names
  names = registry.patterns.keys.sort

  while(1)
    # Get a pattern at random
    i = rand(names.size)
    name = names[i]
    pattern = registry.patterns[name]

    # Print the pattern
    pattern.print_without_name
    puts

    # Get the answer
    print "Press ENTER for the pattern's name> "
    gets
    puts
    puts pattern.name
    puts
    
    # Continue
    print "Press ENTER to continue ('quit' or 'exit' to quit)> "
    choice = gets.chomp.downcase
    exit if(choice == 'exit' || choice == 'quit')
  end
end

# Let the user review the design patterns
def do_review(registry)
  # Get an array of names
  names = registry.patterns.keys.sort

  while(1) 
    i = 0
    
    # Print each name
    puts
    puts "Patterns"
    names.each do |name|
      i += 1
      printf("%2i) %s\n", i, name)
    end
    
    puts
    print "Choose a pattern (0 to exit)> "
    choice = gets.to_i
    return if(choice == 0)
    
    if(choice > 0 && choice <= names.size)
      puts
      name = names[choice-1]
      registry.patterns[name].print

      puts
      print "Press ENTER when done> "
      gets
    end
  end
end

#==============================================================================
# Main
#==============================================================================

registry = DesignPatternRegistry.new("./patterns/")

puts "Design Patterns Quiz - Welcome!"
puts ""
puts "Choices"
puts "1) Quiz"
puts "2) Review"
puts ""

choice = 0
while(choice != 1 && choice != 2) 
  print "Your choice: "
  choice = gets.to_i
end

case choice
when 1
  do_quiz(registry)
when 2
  do_review(registry)
end

