class Airline

  attr_reader :id
  attr_accessor :airline_name, :logo

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @airline_name = params['airline_name']
    @logo = params['logo']
  end

end