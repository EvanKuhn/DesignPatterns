#==============================================================================
# A registry of design patterns. Initialized by reading all the the .pattern
# files within a directory.
#
# Evan Kuhn 2011-07-16
#==============================================================================
require 'design-pattern'

class DesignPatternRegistry
  # You can get the patterns, stored in a hash. The key is the pattern name.
  attr_accessor :patterns

  # Initialize the registry by reading all .pattern files within the directory
  def initialize(dir)
    # Create a new patterns hash
    @patterns = Hash.new

    # Get the pattern files in the directory
    dir += '/' if(!dir.end_with?('/'))
    files = Dir.glob(dir + "*.pattern")

    # Create a DesignPattern for each file
    files.each do |f|
      pattern = DesignPattern.new(f)
      @patterns[pattern.name] = pattern
    end
  end
end
      
