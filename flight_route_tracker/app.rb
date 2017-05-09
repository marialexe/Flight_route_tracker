require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/airline_controller.rb')
require_relative('controllers/deal_controller.rb')
require_relative('controllers/route_controller.rb')

get '/' do
  erb(:index)
end