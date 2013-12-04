require 'open-uri'

module API
  class Base < Grape::API
    version "v1", using: :path
    format :json

    helpers do
      def authenticate!
        error!("Unauthorized. Invalid token.", 401) unless ApiKey.find_by_access_token_and_active(params[:key], true)
      end
    end

    # Google Maps
    resource :maps do

      # Geocoder
      desc "Converts addresses into geographic coordinates"
      get :geocode do
        authenticate!
        Geocoder.search params[:address]
      end

      # Distance Matrix
      desc "Provides travel distance and time for a matrix of origins and destinations."
      get :distancematrix do
        authenticate!

        # Prepare the query
        query = params.except(:route_info).merge({
          client: ENV["GOOGLE_MAPS_CLIENT_ID"],
          key: nil,
        })

        # Generate the URI
        uri = URI::HTTPS.build(
          host: "maps.googleapis.com",
          path: "/maps/api/distancematrix/json",
          query: query.to_query,
        )

        # Sign the URI
        signed = GoogleBusinessApiUrlSigner.add_signature(uri, ENV["GOOGLE_MAPS_SECRET_KEY"])

        # Fetch the data
        JSON.parse(open(signed).read)
      end

    end
  end
end