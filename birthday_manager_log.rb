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

