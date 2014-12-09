require  "./Book"
require  "./Order"
require  "./Reader"
require  "./Author"


class Library
	attr_accessor :books, :orders, :readers, :authors

  def initialize 
    @books=[]
    @orders=[]
    @readers=[]
    @authors=[]  
  end

  def add_book(title, author)
    book = Book.new(title, author)
    books << book
  end


  def add_order(book, reader, date = Time.now)
    order = Order.new(book, reader, date)
    orders << order
  end


  def add_reader(name, email, city, street, hose)
    reader = Reader.new(name, email, city, street, hose)
    readers << reader
  end


  def add_author(name, biography)
    author = Author.new(name, biography)
    authors << author
  end



  def who_often_takes_the book
    br =  Hash.new(0)
    @orders.each { |order| br[order.reader] += 1 if book == order.book }  
    br.max_by{ |key, value| value }.first
  end


  
  def what_is_the_most_popular_book
    popular_book =  Hash.new(0)
    @orders.each { |order| popular_book[order.book] += 1 }  
    popular_book.max_by{ |key, value| value }.first
  end
 

  def How_many_people_ordered_one_of_the_three_most_popular_books(three)
    three_popular_book =  Hash.new(0)
    @orders.each { |order| three_popular_book[order.book] += 1 }
    three_popular_book.sort_by(&:last).take(three).map(&:first)
    chtec = []
    @orders.each { |order| chtec << order.reader if three_popular_book.include? order.book }
    chtec.uniq.size
  end

 end


lib = Library.new
lib.add_book("GP", "JP Rolling")
lib.add_book("The Hobbit", "J.R.R. Tolkien")
lib.add_book("A song of Ice and Fire", "George R.R. Martin")
lib.add_book("Howl`s Moving Castle", "Diana Wynne Jones")
puts lib.books.inspect
lib.add_author("JP Rolling", "One of the best writers")
lib.add_author("J.R.R. Tolkien", "One of the best writers")
lib.add_author("George R.R. Martin", "One of the best writers")
lib.add_author("Diana Wynne Jones", "One of the best writers")
puts lib.authors.inspect
lib.add_reader("Beck92", "z.i.d.92@mail.ru", "Dp.ua", "Kirova", 127)
lib.add_reader("DarkRiderUa", "DarkRiderUa@mail.eu", "Dp.ua", "Kirova", 24)
puts lib.readers.inspect
lib.add_order("GP","Beck92")
lib.add_order("GP","Beck92")
lib.add_order("A song of Ice and Fire","Beck92")
lib.add_order("The Hobbit","DarkRiderUa")
puts lib.orders.inspect
puts lib.who_often_takes_the("GP")
puts lib.what_is_the_most_popular_book
puts lib.How_many_people_ordered_one_of_the_three_most_popular_books(3)

