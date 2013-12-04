module API
  class Base < Grape::API
    version "v1", using: :path
    format :json

    helpers do
      def authenticate!
        error!("Unauthorized. Invalid token.", 401) unless ApiKey.find_by_access_token(params[:key])
      end
    end

    # Google Geocoder
    resource :geocode do
      desc "Converts addresses into geographic coordinates"
      params do
        requires :address, type: String, desc: "The address that you want to geocode."
      end
      get do
        authenticate!
        Geocoder.search params[:address]
      end
    end
  end
end