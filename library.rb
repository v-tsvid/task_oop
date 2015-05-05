require_relative './order.rb'


FILE_AUTHORS = './authors.dat'
FILE_BOOKS = './books.dat'
FILE_READERS = './readers.dat'
FILE_ORDERS = './orders.dat'

class Library
  attr_accessor :books, :orders, :readers, :authors

  def initialize()
    begin
  	  @books, @orders, @readers, @authors = Array.new
      @books   = read_items(Book, FILE_BOOKS)
      @authors = read_items(Author, FILE_AUTHORS)
      @readers = read_items(Reader, FILE_READERS)
      @orders  = read_items(Order, FILE_ORDERS)
      puts "Library was created"
    rescue
      puts "ERROR! Library wasn't created"
    end
  end

  def read_items(class_name, file_name)
    begin
      items = Array.new
      file = File.new(file_name)
      if file
        file.each do |line|
          a = line.split('|')
          items << class_name.new(*a)
        end
        puts "#{class_name}s were readed"
        return items
      end
    rescue Errno::ENOENT => e
      puts "File \"#{file_name}\" not found"
    rescue ArgumentError => e
      puts "It's argument error exception"
      puts e.message
      raise
    ensure
      file.close unless file.nil?
    end
  end

  # def add_item(class_name, file_name, *params)
  #   item = class_name.new(*params)
  #   begin
  #     file = File.new(file_name, 'a')
  #     if file
  #       file << "#{item.title}/#{item.author}\n" 
  #       puts "#{item.capitalize} was added"
  #       return item
  #     end
  #   rescue Errno::ENOENT => e
  #     puts "File \"#{file_name}\" not found"
  #   ensure
  #     file.close unless file.nil?
  #   end
  # end

  def pop_book
    pop_books = Array.new
    popbook = ""
    count = 0
    @orders.each do |order|
      pop_books << "\"#{order.book.title}\", by #{order.book.author.name}"
    end

    pop_books.each do |pop_book|
      if pop_books.count(pop_book) > count
        count = pop_books.count(pop_book)
        popbook = pop_book
      end
    end

    puts "The most popular book is #{popbook} with #{count} orders"
  end

  def takes_more_than(x)
    readers = Array.new
    active_readers = Array.new
    
    @orders.each do |order|
      readers << "#{order.reader.name}"
    end  
    
    readers.each do |reader|
      active_readers << "#{reader} with #{readers.count(reader)} orders" if readers.count(reader) > x
    end
 
    puts "Readers takes more than #{x} books:"
    active_readers.uniq.each do |a_reader|
      puts a_reader
    end
  end

  def takes_one_of_three_books
    count = 0
    pop_books = Array.new
    first = 0
    second = 0
    third = 0
    f_book = ""
    s_book = ""
    t_book = ""
    
    @orders.each do |order|
      pop_books << order.book.title
    end

    pop_books.each do |book|
      if pop_books.count(book) > first
        first = pop_books.count(book)
        f_book = book

      elsif pop_books.count(book) > second && book != f_book
        second = pop_books.count(book)
        s_book = book
      
      elsif pop_books.count(book) > third && book != f_book && book != s_book
        third = pop_books.count(book)
        t_book = book
      end
    end

    puts "First book is #{f_book}"
    puts "Second book is #{s_book}"
    puts "Third book is #{t_book}"

    @orders.each do |order|
      count += 1 if order.book.title == f_book || order.book.title == s_book || order.book.title == t_book
    end
    puts "Three most popular books were ordered by #{count} people"
  end
end