require 'logger'

class Command
  
  attr_accessor :command, :document
  
  # Take the input that was entered, split it and send to be processed
  def input(command)
    command = command.split(" ")
    process(command)
  end
  
  # Process the command that was entered
  def process(command)
    
    return unless document_created?(command)
    
    case command.first
    when "I"
      # Initialize the document M,N with white pixels
      @document = Document.new(command[1], command[2])

    when "C"
      # Clear the table
      @document.clear
      
    when "L"
      # Colour pixel X,Y with colour C
      @document.colour(command[1], command[2], command[3])
    
    when "V"
      # Draw vertical segment X, Y1,Y2, C
      @document.fill_column(command[1], command[2], command[3], command[4])
      
    when "H"
      # Draw horizontal segment X1,X2,Y,C
      @document.fill_row(command[1], command[2], command[3], command[4])
      
    when "F"
      document.fill_region(command[1], command[2], command[3])
      
    when "S"
      # Show contents
      @document.print
      
    when "X"
      # Terminate session
      Logger.info "Terminating session"
      exit 0
      
    else
      Logger.warn "Invalid command"
      
    end
  end
  
  # Check if we have a document yet, or if the current command is going to create one
  def document_created?(command)
    if @document.nil? && !["X","I"].include?(command.first)
      Logger.warn("No document created. Start by running I X Y")
      return false
    end
    true
  end
  
end
