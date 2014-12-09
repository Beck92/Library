

class Reader
	attr_accessor :name, :email, :city, :hose
  def initialize(name, email, city, street, hose)
	   @name, @email, @city, @street, @hose = name, email, city, street, hose
  end

    def to_s
   	 "Reader: #{@name} | #{@email} | #{@city} | #{@street} | #{@hose} "
    end
end