class Reader
  attr_accessor :name, :email, :city, :street, :house

  def initialize(*params)
  	@name   = params[0]
  	@email  = params[1]
  	@city   = params[2]
  	@street = params[3]
  	@house  = params[4]
  end

  # def inspect(sep)
  # 	str = String.new
  	
  # 	if @name
  # 	  str << @name
  #   end

  # 	if @email 
  # 	  str << sep
  # 	  str << @email
  # 	end

  # 	if @city 
  # 	  str << sep
  # 	  str << @city
  # 	end

  # 	if @street
  # 	  str << sep
  # 	  str << @street
  #   end

  # 	if @house 
  # 	  str << sep
  # 	  str << @house
  # 	end 
  # end
end