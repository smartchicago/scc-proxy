module API
  class Base < Grape::API
    version "v1", using: :path
    format :json

    # Google Geocoder
    resource :geocode do
      desc "Converts addresses into geographic coordinates"
      params do
        requires :address, type: String, desc: "The address that you want to geocode."
      end
      get do
        Geocoder.search params[:address]
      end
    end

  end
end