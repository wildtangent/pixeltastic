# Log something
class Logger
  
  @@level = 0
  
  def self.level=(level)
    @@level = level
  end
  
  def self.info(message)
    log(message) if @@level > 0
  end
  
  def self.debug(message)
    log(message) if @@level > 1
  end
  
  def self.log(message)
    puts message
  end
  
end