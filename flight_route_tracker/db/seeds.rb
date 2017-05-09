require('pry-byebug')
require_relative('../models/customer.rb')
require_relative('../models/airline.rb')
require_relative('../models/flight_route.rb')
require_relative('../models/deal.rb')
# require_relative('../models/airline_deal.rb')
# require_relative('../models/route_deal.rb')
require_relative('../models/airline_route.rb')

Customer.delete_all()
Airline.delete_all()
FlightRoute.delete_all()
Deal.delete_all()
# AirlineDeal.delete_all()
# RouteDeal.delete_all()
AirlineRoute.delete_all()

# ----------------Customers----------------
customer1 = Customer.new({
  'customer_name' => "Dina",
  'budget' => 450,
  'currency' => "GBP"
  })
customer1.save()

# ----------------Airlines----------------

airline1 = Airline.new({
  'airline_name' => "Lufthansa",
  'logo' => "Lufthansa_logo.jpg"})
  airline1.save()

  airline2 = Airline.new({
    'airline_name' => "KLM",
    'logo' => "KLM_logo.png"
    })
  airline2.save()

  airline3 = Airline.new({
    'airline_name' => "British Airways",
    'logo' => "BritishAirways_logo.jpg"
    })
  airline3.save()

  airline4 = Airline.new({
    'airline_name' => "Emirates",
    'logo' => "Emirates_logo.png"
    })
  airline4.save()

  # --------------Fligt-Routes--------------

  flight_route1 = FlightRoute.new({
    'origin' => "Amsterdam",
    'destination' => "Tokyo",
    'route' => "Amsterdam - Tokyo",
    'price' => 750,
    'currency' => "EUR"
    })
  flight_route1.save()

  flight_route2 = FlightRoute.new({
    'origin' => "Edinburgh",
    'destination' => "Tromsø",
    'route' => "Edinburgh - Tromsø",
    'price' => 300,
    'currency' => "GBP"
    })
  flight_route2.save()

  flight_route3 = FlightRoute.new({
    'origin' => "Glasgow",
    'destination' => "Vancouver",
    'route' => "Glasgow - Vancouver",
    'price' => 580,
    'currency' => "GBP"
    })
  flight_route3.save()

  flight_route4 = FlightRoute.new({
    'origin' => "London",
    'destination' => "New York",
    'route' => "London - New York",
    'price' => 420,
    'currency' => "EUR"
    })
  flight_route4.save()

  # -----------------Deals------------------

    # -----<Coding-for-7-models-approach>----

  # deal1 = Deal.new({
  #   'label' => "Two for one Mondays",
  #   'weekday' => "Mondays",
  #   'month' => "February",
  #   'discount' => 50,
  #   'type' => "percentage"
  #   })
  # deal1.save()

  # deal2 = Deal.new({
  #   'label' => "January sales",
  #   'weekday' => "Any",
  #   'month' => "January",
  #   'discount' => 40,
  #   'type' => "percentage"
  #   })
  # deal2.save()

  # deal3 = Deal.new({
  #   'label' => "£50 less Wednesdays",
  #   'weekday' => "Wednesday",
  #   'month' => "Any",
  #   'discount' => 50,
  #   'type' => "amount"
  #   })
  # deal3.save()

  # deal4 = Deal.new({
  #   'label' => "Spring deals Tuesdays",
  #   'weekday' => "Tuesday",
  #   'month' => "April",
  #   'discount' => 25,
  #   'type' => "percentage"
  #   })
  # deal4.save()

  # deal5 = Deal.new({
  #   'label' => "December Thurdays saver",
  #   'weekday' => "Thursday",
  #   'month' => "December",
  #   'discount' => 75,
  #   'type' => "amount"
  #   })
  # deal5.save()

  # -----<Coding-for-5-models-approach>----

  deal1 = Deal.new({
    'label' => "Two for one Mondays",
    'weekday' => "Mondays",
    'month' => "February",
    'discount' => 50,
    'type' => "percentage",
    'airline_id' => airline2.id(),
    'route_id' => flight_route1.id()
    })
  deal1.save()

  deal2 = Deal.new({
    'label' => "January sales",
    'weekday' => "Any",
    'month' => "January",
    'discount' => 40,
    'type' => "percentage",
    'airline_id' => airline4.id(),
    'route_id' => flight_route3.id()
    })
  deal2.save()

  deal3 = Deal.new({
    'label' => "£50 less Wednesdays",
    'weekday' => "Wednesday",
    'month' => "Any",
    'discount' => 50,
    'type' => "amount",
    'airline_id' => airline2.id(),
    'route_id' => flight_route4.id()
    })
  deal3.save()

  deal4 = Deal.new({
    'label' => "Spring deals Tuesdays",
    'weekday' => "Tuesday",
    'month' => "April",
    'discount' => 25,
    'type' => "percentage",
    'airline_id' => airline1.id(),
    'route_id' => flight_route2.id()
    })
  deal4.save()

  deal5 = Deal.new({
    'label' => "December Thurdays saver",
    'weekday' => "Thursday",
    'month' => "December",
    'discount' => 75,
    'type' => "amount",
    'airline_id' => airline4.id(),
    'route_id' => flight_route1.id()
    })
  deal5.save()


# -------------Airline-Deals----------------
# -----<ONLY-Needed-for-7-models-approach>----
# ------<Discarded-for-5-models-approach>---

# airline_deal1 = AirlineDeal.new({
#   'airline_id' => airline1.id(),
#   'deal_id' => deal4.id()
#   })
# airline_deal1.save()

# airline_deal2 = AirlineDeal.new({
#   'airline_id' => airline2.id(),
#   'deal_id' => deal3.id()
#   })
# airline_deal2.save()

# airline_deal3 = AirlineDeal.new({
#   'airline_id' => airline3.id(),
#   'deal_id' => deal4.id()
#   })
# airline_deal3.save()

# airline_deal4 = AirlineDeal.new({
#   'airline_id' => airline4.id(),
#   'deal_id' => deal2.id()
#   })
# airline_deal4.save()

# airline_deal5 = AirlineDeal.new({
#   'airline_id' => airline2.id(),
#   'deal_id' => deal1.id()
#   })
# airline_deal5.save()

# -------------Route-Deals----------------
# -----<ONLY-Needed-for-7-models-approach>----
# ------<Discarded-for-5-models-approach>---

# route_deal1 = RouteDeal.new({
#   'route_id' => flight_route2.id(),
#   'deal_id' => deal4.id()
#   })
# route_deal1.save()

# route_deal2 = RouteDeal.new({
#   'route_id' => flight_route1.id(),
#   'deal_id' => deal1.id()
#   })
# route_deal2.save()

# route_deal3 = RouteDeal.new({
#   'route_id' => flight_route3.id(),
#   'deal_id' => deal2.id()
#   })
# route_deal3.save()

# route_deal4 = RouteDeal.new({
#   'route_id' => flight_route1.id(),
#   'deal_id' => deal2.id()
#   })
# route_deal4.save()

# -------------Airline-Routes----------------

airline_route1 = AirlineRoute.new({
  'airline_id' => airline1.id(),
  'route_id' => flight_route4.id()
  })
airline_route1.save()

airline_route2 = AirlineRoute.new({
  'airline_id' => airline2.id(),
  'route_id' => flight_route1.id()
  })
airline_route2.save()

airline_route3 = AirlineRoute.new({
  'airline_id' => airline3.id(),
  'route_id' => flight_route3.id()
  })
airline_route3.save()

airline_route4 = AirlineRoute.new({
  'airline_id' => airline2.id(),
  'route_id' => flight_route2.id()
  })
airline_route4.save()

binding.pry
nil



