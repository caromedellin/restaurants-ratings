class RestaurantModel
  attr_reader :restaurant_name, :cuisine, :address, :zip, :phone
  def initialize(args = {})
    @restaurant_name = args["dba"]
    @cuisine = args["cuisine_description"]
    @building = args["building"].nil? ? "" : args["building"].strip
    @street = args["street"].nil? ? "" : args["street"].strip
    @address = "#{@building} #{@street}"
    @zip = args["zipcode"]
    @phone = args["phone"]
  end

  def to_s
    "#{cuisine}: #{self.restaurant_name} #{address}"
  end
end

class Directory
  attr_reader :restaurants

 def initialize(restaurants)
  @restaurants = restaurants
 end

  def to_s
    @restaurants.each { |restaurant| restaurant.to_s}
  end
end
