class Author
  attr_accessor :name, :biography

  def initialize (*params)
  	@name      = params[0]
  	@biography = params[1]
  end

  # def inspect(sep)
  # 	str = String.new
  	
  # 	if @name
  # 	  str << @name
  #   end

  # 	if @biography 
  # 	  str << sep
  # 	  str << @biography
  # 	end
  # end
end