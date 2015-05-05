require_relative './author.rb'

class Book
  attr_accessor :title, :author

  def initialize (*params)
  	@title  = params[0]
  	if params[1]
  	  a = params[1].split('\\')
  	  @author = Author.new(*a)
  	end
  end

  # def inspect(sep1, sep2)
  # 	str = String.new

  # 	if @title
  # 	  str << @title
  # 	end

  # 	if @author
  # 	  str << sep1
  # 	  str << @author.inspect(sep2)
  # 	end 
  # end
end