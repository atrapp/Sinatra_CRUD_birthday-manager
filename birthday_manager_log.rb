require 'pg'
require 'active_record'

# connect to database
database_name = "birthday_manager_db"
ActiveRecord::Base.establish_connection("postgres://localhost/#{database_name}")

# define models
class Person < ActiveRecord::Base
  belongs_to :country
  belongs_to :group
end

class Country < ActiveRecord::Base
  has_many :people
end

class Group < ActiveRecord::Base
  has_many :people
end

# testing
country = Country.create({name: 'England', countrycode: 'UK', description: 'England is a country that is part of the United Kingdom', image_url: "http://hewgill.com/flags/gb.svg"})
group = Group.create({name: 'Friends'})
person = Person.create({name: 'Linda', gender: 'F', date_of_birth: "10/01/1980", image_url: "https://openclipart.org/image/800px/svg_to_png/181239/1375025979.png"})

country.people << person
group.people << person

# result
puts "Person name:  " + person.name
puts "Person country:   " + person.country.name
puts "Person group: " + person.group.name
