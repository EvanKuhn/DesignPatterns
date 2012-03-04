#==============================================================================
# A design pattern class
#
# Evan Kuhn, 2011-07-16
#==============================================================================

class DesignPattern
  attr_accessor :name, :desc, :diagram

  # Read the pattern from a file
  def initialize(filename)
    @name = ''
    @desc = ''
    @diagram = ''
    
    file = File.open(filename)
    
    while(line = file.gets)
      line.chomp!
      if(line == 'NAME')
        @name = file.gets.chomp!
      elsif(line == 'DESC')
        while((line = file.gets) && line != "END\n")
          @desc += line
        end
      elsif(line == 'DIAGRAM')
        while((line = file.gets) && line != "END\n")
          @diagram += line
        end      
      end
    end
    file.close()
  end  

  # Print the pattern to the standard output stream
  def print
    puts SEPARATOR
    puts @name
    puts SEPARATOR
    puts @desc
    if(@diagram)
      puts
      puts "Diagram:"
      puts
      puts @diagram
    end
  end

  # Print the pattern with the name hidden. For quizzing.
  def print_without_name
    backup = @name
    @name = '???'
    print
    @name = backup
  end
  
  private
  SEPARATOR = '----------' * 8
end
