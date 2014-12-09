

class Order
	attr_accessor :book, :reader
  def initialize(book, reader, date = Time.now)
    @book, @reader, @date = book, reader, date
  end

  def to_s
    "Order: #{@book} | #{@reader} | #{@date}   "
  end
end
