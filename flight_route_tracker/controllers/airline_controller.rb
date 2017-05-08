require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/airline.rb')
require_relative('../models/flight_route.rb')

#-------------MVP-#1-------------

# list all airlines
get '/airlines' do
  @airlines = Airline.all()
  erb(:"airlines/index")
end

# new airline
get '/airlines/new' do
  @airlines = Airline.all()
  erb(:"airlines/new")
end

# create new airline
post '/airlines' do
  airline = Airline.new(params)
  airline.save()
  redirect ('/airlines')
end

# show the (id) airline 
get '/airlines/:id' do 
  @airline = Airline.find(params['id'])
  erb(:"airlines/show")
end

# delete the (id) airline 
post '/airlines/:id/delete' do 
  @airline = Airline.find(params['id'])
  @airline.delete()
  redirect ('/airlines')
end

#-------------MVP-#2--------------

get '/airlines/:id/routes' do
  @airline = Airline.find(params['id'])
  @routes = @airline.route()
  erb(:"airlines/show_routes")
end