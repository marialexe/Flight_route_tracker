require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/airline_controller.rb')

get '/' do
  erb(:index)
end