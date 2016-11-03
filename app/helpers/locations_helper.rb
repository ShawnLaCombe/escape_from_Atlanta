module LocationsHelper
# Help out model and controller
#Modules can be called anywhere

#Grab all bueses from the API and decide which are closest.
  def  fetch_buses_from_api(source_url)
    # Gets the entire HTTP message
    http = Net::HTTP.get_response(URI.parse(source_url))
    # Split out the body
    data = http.body
    JSON.parse(data)
  end 

  def max_distance_conversion(selected_option)
    if selected_option == "1"
      0.01 
    elsif selected_option == "2"
      0.02 
    elsif selected_option == "3"
      0.05 
    else selected_option == "4" 
      1.0 
    end
  end 

  def is_nearby?(user_lat, user_long, bus_lat, bus_long, max_distance_from_form)
    # Maximum distance in degrees we want to walk  
    max_distance = max_distance_conversion(max_distance_from_form)

    difference_latitudes = user_lat - bus_lat.to_f
    difference_longitudes = user_long - bus_long.to_f

    distance = Math.sqrt(difference_latitudes ** 2 + difference_longitudes ** 2)
    distance <= max_distance
  end


end
