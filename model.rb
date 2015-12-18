# https://data.cityofnewyork.us/resource/43nn-pn8j.json?$select=dba,zipcode,grade,COUNT(grade)&zipcode=10024&$group=dba,grade,zipcode

# Select zipcode, restaurant names, grade, count of each grade


# https://data.cityofnewyork.us/resource/43nn-pn8j.json?$select=zipcode,grade,grade_date,COUNT(grade)&zipcode=10021&dba=Glorious%20Food&$where%20grade_date%3E2015&$group=grade,zipcode,grade_date&$order=grade_date%20DESC


# https://data.cityofnewyork.us/resource/43nn-pn8j.json?$select=zipcode,dba,grade,COUNT(grade)&zipcode=10021&$where=grade_date%20%3E%20%272015%27&$group=dba,grade,zipcode,grade_date&$order=dba%20ASC


#https://data.cityofnewyork.us/resource/43nn-pn8j.json?$select=zipcode,dba,grade&zipcode=10021&$where=grade_date%20%3E%20%272015%27&$group=dba,grade,zipcode,grade_date&$order=dba%20ASC

require 'pry'

class RestaurantModel
  def initialize(args = {})
    restaurant_name = args[:restaurant_name].chomp
    cuisine = args[:cuisine]
    address = "#{args[:building]} #{args[:street]}"
    zip = args[:zipcode]
    phone = args[:phone]
  end

  def to_s
    "#{cuisine}: #{self.restaurant_name} #{address}\n"
  end
end

class Directory
 def initialize(restaurants)
  @restaurants = restaurants
 end

  def to_s
    @restaurants.each { |restaurant| restaurant.to_s}
  end
end

data = [{
  "phone" : "2124522011",
  "building" : "1303      ",
  "street" : "3 AVENUE                                          ",
  "dba" : "MCKEOWN'S",
  "zipcode" : "10021",
  "cuisine_description" : "Irish"
}
, {
  "phone" : "2124521304",
  "building" : "1450",
  "street" : "2ND AVE",
  "dba" : "MEL'S BURGER",
  "zipcode" : "10021",
  "cuisine_description" : "American "
}
, {
  "phone" : "2125359600",
  "building" : "1295",
  "street" : "THIRD AVENUE",
  "dba" : "MEZZALUNA",
  "zipcode" : "10021",
  "cuisine_description" : "Italian"
}
, {
  "phone" : "2126283724",
  "building" : "417       ",
  "street" : "EAST   70 STREET                                  ",
  "dba" : "MURPHY'S LAW",
  "zipcode" : "10021",
  "cuisine_description" : "Irish"
}
, {
  "phone" : "2126399418",
  "building" : "1324",
  "street" : "2 AVENUE",
  "dba" : "NEW BEIJING WOK",
  "zipcode" : "10021",
  "cuisine_description" : "Chinese"
}
, {
  "phone" : "2129880002",
  "building" : "1354      ",
  "street" : "1 AVENUE                                          ",
  "dba" : "NINO'S RESTAURANT",
  "zipcode" : "10021",
  "cuisine_description" : "Italian"
}
, {
  "phone" : "2127728200",
  "building" : "1431      ",
  "street" : "1 AVENUE                                          ",
  "dba" : "NUMERO 28",
  "zipcode" : "10021",
  "cuisine_description" : "Italian"
}
, {
  "phone" : "2125350002",
  "building" : "1317A",
  "street" : "2ND AVE",
  "dba" : "OITA SUSHI",
  "zipcode" : "10021",
  "cuisine_description" : "Japanese"
}
, {
  "phone" : "2125176400",
  "building" : "1057",
  "street" : "LEXINGTON AVENUE",
  "dba" : "ORSAY",
  "zipcode" : "10021",
  "cuisine_description" : "French"
}
, {
  "phone" : "2124399200",
  "building" : "1347      ",
  "street" : "2 AVENUE                                          ",
  "dba" : "PER LEI",
  "zipcode" : "10021",
  "cuisine_description" : "Italian"
}
, {
  "phone" : "2125351100",
  "building" : "1407      ",
  "street" : "2 AVENUE                                          ",
  "dba" : "PERSEPOLIS",
  "zipcode" : "10021",
  "cuisine_description" : "Mediterranean"
}
, {
  "phone" : "2127728800",
  "building" : "1356",
  "street" : "1 AVENUE",
  "dba" : "PETALUMA",
  "zipcode" : "10021",
  "cuisine_description" : "Italian"
}
, {
  "phone" : "2125177700",
  "building" : "903",
  "street" : "MADISON AVENUE",
  "dba" : "SALUMERIA ROSI PARMACOTTO",
  "zipcode" : "10021",
  "cuisine_description" : "Italian"
}
, {
  "phone" : "2122888033",
  "building" : "339",
  "street" : "EAST   75 STREET",
  "dba" : "SEAMSTRESS",
  "zipcode" : "10021",
  "cuisine_description" : "American "
}
, {
  "phone" : "2125174445",
  "building" : "1359",
  "street" : "1 AVENUE",
  "dba" : "SESSION 73",
  "zipcode" : "10021",
  "cuisine_description" : "American "
}
, {
  "phone" : "2124720400",
  "building" : "969",
  "street" : "LEXINGTON AVENUE",
  "dba" : "SETTE MEZZO",
  "zipcode" : "10021",
  "cuisine_description" : "Italian"
}
, {
  "phone" : "2128615635",
  "building" : "314       ",
  "street" : "EAST   70 STREET                                  ",
  "dba" : "SHABU-SHABU 70 RESTAURANT",
  "zipcode" : "10021",
  "cuisine_description" : "Japanese"
}
, {
  "phone" : "2122888066",
  "building" : "1388",
  "street" : "2 AVENUE",
  "dba" : "SHANGHAI CHINESE RESTAURANT",
  "zipcode" : "10021",
  "cuisine_description" : "Chinese"
}
, {
  "phone" : "2129888002",
  "building" : "1413",
  "street" : "2ND AVE",
  "dba" : "SIX HAPPINESS",
  "zipcode" : "10021",
  "cuisine_description" : "Chinese"
}
, {
  "phone" : "2126067070",
  "building" : "1334      ",
  "street" : "YORK AVENUE                                       ",
  "dba" : "SOTHEBY'S CAFE",
  "zipcode" : "10021",
  "cuisine_description" : "CafÃ©/Coffee/Tea"
}]



binding.pry

p data
