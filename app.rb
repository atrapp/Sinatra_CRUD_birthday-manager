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

# binding.pry


# *****   Routes for people *****

# index
get '/people' do
  @people = Person.all
  erb :'people/index'  
end

# new
get '/people/new' do
  @countries = Country.all
  @groups = Group.all
  erb :'people/new'
end

# create
post '/people' do
  name = params[:name]
  gender = params[:gender]
  date_of_birth = params[:date_of_birth]
  image_url = params[:image_url]
  country_id = params[:country_id]
  group_id = params[:group_id]

  new_person = Person.create({name: name, gender: gender, date_of_birth: date_of_birth, image_url: image_url, country_id: country_id, group_id: group_id})
  redirect "/people/#{new_person.id}"
end

# edit
get '/people/:id/edit' do
  @countries = Country.all 
  @groups = Group.all
  @person = Person.find(params[:id])
  erb :'people/edit'
end

# update
put '/people/:id' do
  updated_person = Person.find(params[:id])

  updated_person.name = params[:name]
  updated_person.gender = params[:gender]
  updated_person.date_of_birth = params[:date_of_birth]
  updated_person.image_url = params[:image_url]
  updated_person.country_id = params[:country_id]
  updated_person.group_id = params[:group_id]

  updated_person.save
  redirect "/people/#{updated_person.id}"
end

# show
get '/people/:id' do
  @person = Person.find(params[:id])
  erb :'people/show'
end

# delete
delete '/people/:id' do
  Person.delete(params[:id])
  redirect '/people'
end


# *****   Routes for countries *****

# index
get '/countries' do
  @countries = Country.all
  erb :'countries/index'
end

# new
get '/countries/new' do
  erb :'countries/new'
end

# create
post '/countries' do
  name = params[:name]
  countrycode = params[:countrycode]
  description = params[:description]
  image_url = params[:image_url]

  new_country = Country.create({name: name, countrycode: countrycode, description: description, image_url: image_url})
  redirect "/countries/#{new_country.id}"
end

# edit
get '/countries/:id/edit' do
  @country = Country.find(params[:id])
  erb :'countries/edit'
end

# update
put '/countries/:id' do
  updated_country = Country.find(params[:id])

  updated_country.name = params[:name]
  updated_country.countrycode = params[:countrycode]
  updated_country.description = params[:description]
  updated_country.image_url = params[:image_url]

  updated_country.save
  redirect "/countries/#{updated_country.id}"
end

# show
get '/countries/:id' do
  @country = Country.find(params[:id])
  erb :'countries/show'
end

# delete
delete '/countries/:id' do
  Country.delete(params[:id])
  redirect "/countries"
end


# *****   Routes for groups *****

# index
get '/groups' do
  @groups = Group.all
  erb :'groups/index'
end

# new
get '/groups/new' do
  erb :'groups/new'
end

# create
post '/groups' do
  name = params[:name]

  new_group = Group.create({name: name})
  redirect "/groups/#{new_group.id}"
end

# edit
get '/groups/:id/edit' do
  @group = Group.find(params[:id])
  erb :'groups/edit'
end

# update
put '/groups/:id' do
  updated_group = Group.find(params[:id])

  updated_group.name = params[:name]

  updated_group.save
  redirect "/groups/#{updated_group.id}"
end

# show
get '/groups/:id' do
  @group = Group.find(params[:id])
  erb :'groups/show'
end

# delete
delete '/groups/:id' do
  Group.delete(params[:id])
  redirect "/groups"
end
