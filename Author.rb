

class Author
	attr_accessor :name, :biography
  def initialize(name, biography)
   	 @name, @biography = name, biography
   end

    def to_s
    	"Author: #{@name} | #{@biography} "
    end
end