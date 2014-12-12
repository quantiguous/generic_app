module BytesToMegabyte
  MEGABYTE = 1024.0 * 1024.0
  def self.convert bytes
    bytes / MEGABYTE  
  end
end
