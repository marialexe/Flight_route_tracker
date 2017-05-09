require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/flight_route.rb')

get '/flight-routes' do
  @routes = FlightRoute.all()
  erb(:"routes/index")
end

get '/flight-routes/new' do 
  @routes = FlightRoute.all()
  @airlines = Airline.all()
  @deals = Deal.all()
  # for route in @routes
  #   # @airline = route.airline()
  # end
  erb(:"routes/new")
end

post '/flight-routes' do
  route = FlightRoute.new(params)
  route.save()
  redirect ('/flight-routes')
end