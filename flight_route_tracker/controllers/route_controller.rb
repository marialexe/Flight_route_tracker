require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/flight_route.rb')
require_relative('../models/airline.rb')
require_relative('../models/deal.rb')

# list all airlines
get '/flight-routes' do
  @routes = FlightRoute.all()
  erb(:"routes/index")
end

# add new flight route
get '/flight-routes/new' do 
  @routes = FlightRoute.all()
  @airlines = Airline.all()
  @deals = Deal.all()

  # for route in @routes
  #   # @airline = route.airline()
  # end
  erb(:"routes/new")
end

# show create new route
post '/flight-routes' do
  route = FlightRoute.new(params)
  route.save()
  redirect ('/flight-routes')
end

# show flight route by id
get '/flight-routes/:id' do
  @route = FlightRoute.find(params['id'])
  @airlines = Airline.all()
  erb(:"routes/show")
end

# delete route by id
post '/flight-routes/:id/delete' do
  @route = FlightRoute.find(params['id'])
  @route.delete()
  redirect ('/flight-routes')
end

# list all the available deals for a given route
get '/flight-routes/:id/deals' do
  @route = FlightRoute.find(params['id'])
  @deals = @route.deal()
  erb(:"routes/show_deals")
end

# new deal for a given route
get '/flight-routes/:id/deals/new' do
  @route =FlightRoute.find(params['id'])
  @deals = @route.deal()
  @routes = FlightRoute.all()
  @deals = Deal.all()
  erb(:"routes/new_deal")
end

# create new deal for a given route
post '/flight-routes/:id/deals' do
  @route =FlightRoute.find(params['id'])
  deal = Deal.new(params)
  deal.save()
  redirect("/flight-routes/#{params['id']}/deals")
end

