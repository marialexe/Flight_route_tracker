require_relative('../models/airline.rb')
require_relative('../models/flight_route.rb')

Airline.delete_all()
Flight_route.delete_all()

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
    'price' => 750
    })
  flight_route1.save()

  flight_route2 = Flight_route.new({
    'origin' => "Edinburgh",
    'destination' => "Tromsø",
    'route' => "Edinburgh - Tromsø",
    'price' => 300
    })
  flight_route2.save()

  flight_route3 = Flight_route.new({
    'origin' => "Glasgow",
    'destination' => "Vancouver",
    'route' => "Glasgow - Vancouver",
    'price' => 580
    })
  flight_route3.save()

  flight_route4 = Flight_route.new({
    'origin' => "London",
    'destination' => "New York",
    'route' => "London - New York",
    'price' => 420
    })
  flight_route4.save()





