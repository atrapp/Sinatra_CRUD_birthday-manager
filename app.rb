require 'bundler'
Bundler.require

require_relative 'models/country'
require_relative 'models/group'
require_relative 'models/person'

require_relative 'config.rb'

#root

get '/' do
  erb :index
end
