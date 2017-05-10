require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/airline.rb')
require_relative('../models/flight_route.rb')
require_relative('../models/deal.rb')
require_relative('../models/route_deal.rb')
require_relative('../models/airline_route.rb')
require_relative('../models/new_airline.rb')


#-------------MVP-#1-------------

# list all airlines
get '/airlines' do
  @airlines = Airline.all()
  erb(:"airlines/index")
end

# new airline
get '/airlines/new' do
  @airlines = Airline.all()
  @new_airlines = NewAirline.all()
  erb(:"airlines/new")
end

# create new airline
post '/airlines' do
  airline = Airline.new(params)
  airline.save()
  redirect ('/airlines')
end

# show airline by id 
get '/airlines/:id' do 
  @airline = Airline.find(params['id'])
  erb(:"airlines/show")
end

# delete airline by id
post '/airlines/:id/delete' do 
  @airline = Airline.find(params['id'])
  @airline.delete()
  redirect ('/airlines')
end

#-------------MVP-#2--------------

#list all the available routes for a given airline 
get '/airlines/:id/routes' do
  @airline = Airline.find(params['id'])
  @routes = @airline.route()
  erb(:"airlines/show_routes")
end

# new flight route for a given airline
get '/airlines/:id/routes/new' do
  @airline = Airline.find(params['id'])
  @routes = @airline.route()
  @airlines = Airline.all()
  @deals = Deal.all()
  erb(:"airlines/new_route")
end

# create new route for a given airline
post '/airlines/:id/routes' do
  route = FlightRoute.new(params)
  route.save()
  redirect("/airlines/#{params['id']}/routes")
end

#-------------MVP-#3--------------
#list all the DEALS for a given airline 
get '/airlines/:id/deals' do
  @airline = Airline.find(params['id'])
  @deals = @airline.deal()
  erb(:"airlines/show_deals")
end

# new DEAL for a given airline
get '/airlines/:id/deals/new' do
  @airline = Airline.find(params['id'])
  @routes = @airline.route()
  @deals = @airline.deal()
  erb(:"airlines/new_deal")
end

# create new route for a given airline
post '/airlines/:id/deals' do
  route = Deal.new(params)
  route.save()
  redirect("/airlines/#{params['id']}/deals")
end