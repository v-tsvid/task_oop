require 'date'
require_relative './book.rb'
require_relative './reader.rb'

class Order
  attr_accessor :book, :reader, :date

  def initialize(*params)
  	if params[0]
  	  a = params[0].split('/')
  	  @book = Book.new(*a)
  	end

  	if params[1]
  	  a = params[1].split('/')
  	  @reader = Reader.new(*a)
  	end

  	@date = Date.parse(params[2]) if params[2]
  end

  # def inspect(sep1, sep2, sep3)
  # 	str = String.new
  	
  # 	if @book
  # 	  str << @book.inspect(sep2, sep3)
  # 	end

  # 	if @reader
  # 	  str << sep1
  # 	  str << @reader.inspect(sep2)
  # 	end

  # 	if @date
  # 	  str << sep1
  # 	  str << @date.to_s
  # 	end
  # end
end