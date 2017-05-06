require('pry-byebug')
require_relative('../models/customer.rb')
require_relative('../models/airline.rb')
require_relative('../models/flight_route.rb')
require_relative('../models/deal.rb')
require_relative('../models/airline_deal.rb')

Customer.delete_all()
Airline.delete_all()
Flight_route.delete_all()
Deal.delete_all()
Airline_deal.delete_all()

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
  'logo' => "https://www.google.co.uk/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwjj0ILk_drTAhUsAcAKHTkoBIwQjRwIBw&url=http%3A%2F%2Fsymbolsnet.com%2Fsymbols%2Flufthansa-airlines-symbol.html&psig=AFQjCNH46Yr12SxYLFm4um5Q5HvTF2KtAA&ust=1494150241394589"})
  airline1.save()

  airline2 = Airline.new({
    'airline_name' => "KLM",
    'logo' => "https://www.google.co.uk/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwjQ3YOqgNvTAhWKK8AKHdCIDe4QjRwIBw&url=http%3A%2F%2Fsupersmarttag.com%2F&psig=AFQjCNHPoGU9S9guLTgSvQesWEsuZ2FlUQ&ust=1494150925485171"
    })
  airline2.save()

  airline3 = Airline.new({
    'airline_name' => "British Airways",
    'logo' => "https://www.google.co.uk/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwiu29jygNvTAhUrI8AKHeAKDQAQjRwIBw&url=http%3A%2F%2Fwww.logodesignlove.com%2Fbritish-airways-logo-evolution&psig=AFQjCNFzlThqrnPOKXHlF_rlbA0fzw9xQQ&ust=1494151093813120"
    })
  airline3.save()

  airline4 = Airline.new({
    'airline_name' => "Emirates",
    'logo' => "https://www.google.co.uk/search?q=emirates+logo&biw=1280&bih=655&tbm=isch&imgil=BKXyJLYXfUk83M%253A%253BFy6yz17eopdYqM%253Bhttps%25253A%25252F%25252Fdwglogo.com%25252Femirates-logo%25252F&source=iu&pf=m&fir=BKXyJLYXfUk83M%253A%252CFy6yz17eopdYqM%252C_&usg=__MBb9iGlXPxbrAzVuBicTUjA8lrA%3D"
    })
  airline4.save()

  # --------------Fligt-Routes--------------

  flight_route1 = Flight_route.new({
    'origin' => "Amsterdam",
    'destination' => "Tokyo",
    'route' => "Amsterdam - Tokyo",
    'price' => 750,
    'currency' => "EUR"
    })
  flight_route1.save()

  flight_route2 = Flight_route.new({
    'origin' => "Edinburgh",
    'destination' => "Tromsø",
    'route' => "Edinburgh - Tromsø",
    'price' => 300,
    'currency' => "GBP"
    })
  flight_route2.save()

  flight_route3 = Flight_route.new({
    'origin' => "Glasgow",
    'destination' => "Vancouver",
    'route' => "Glasgow - Vancouver",
    'price' => 580,
    'currency' => "GBP"
    })
  flight_route3.save()

  flight_route4 = Flight_route.new({
    'origin' => "London",
    'destination' => "New York",
    'route' => "London - New York",
    'price' => 420,
    'currency' => "EUR"
    })
  flight_route4.save()

  # -----------------Deals------------------

  deal1 = Deal.new({
    'label' => "Two for one Mondays",
    'weekday' => "Mondays",
    'month' => "February",
    'discount' => 50,
    'type' => "percentage"
    })
  deal1.save()

  deal2 = Deal.new({
    'label' => "January sales",
    'weekday' => "Any",
    'month' => "January",
    'discount' => 40,
    'type' => "percentage"
    })
  deal2.save()

  deal3 = Deal.new({
    'label' => "£50 less Wednesdays",
    'weekday' => "Wednesday",
    'month' => "Any",
    'discount' => 50,
    'type' => "amount"
    })
  deal3.save()

  deal4 = Deal.new({
    'label' => "Spring deals Tuesdays",
    'weekday' => "Tuesday",
    'month' => "April",
    'discount' => 25,
    'type' => "percentage"
    })
  deal4.save()

# -------------Airline-Deals----------------

airline_deal1 = Airline_deal.new({
  'airline_id' => airline1.id(),
  'deal_id' => deal4.id()
  })
airline_deal1.save()

airline_deal2 = Airline_deal.new({
  'airline_id' => airline2.id(),
  'deal_id' => deal3.id()
  })
airline_deal2.save()

airline_deal3 = Airline_deal.new({
  'airline_id' => airline3.id(),
  'deal_id' => deal4.id()
  })
airline_deal3.save()

airline_deal4 = Airline_deal.new({
  'airline_id' => airline4.id(),
  'deal_id' => deal2.id()
  })
airline_deal4.save()

airline_deal5 = Airline_deal.new({
  'airline_id' => airline2.id(),
  'deal_id' => deal1.id()
  })
airline_deal5.save()

binding.pry
nil



