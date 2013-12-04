Geocoder.configure(
  :lookup => :google_premier, 
  :api_key => [ENV["GOOGLE_MAPS_SECRET_KEY"], ENV["GOOGLE_MAPS_CLIENT_ID"], nil],
)