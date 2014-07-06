database_name = "birthday_manager_db"
ActiveRecord::Base.establish_connection("postgres://localhost/#{database_name}")
