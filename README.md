# SCC Proxy

A simple proxy server that allows us to control access to the Google Maps API.

## Installation

```
$ git clone git@github.com:smartchicago/scc-proxy.git
$ cd scc-proxy
$ gem install bundler
$ bundle install
$ rake db:setup
$ cp config/application.yml.example config/application.yml
```

Populate the `application.yml` file with config settings. Values can be found via `heroku config`.

```
bundle exec unicorn
```

Navigate to http://localhost:8080

## Using the Proxy

In order to use the proxy, you must have an API key. Please contact one of the team members if you require access.

## Endpoints

### geocode

Proxies access to the [Geocoding API](https://developers.google.com/maps/documentation/geocoding/).

http://services.smartchicagoapps.org/v1/maps/geocode?address=3324+N+California+Ave%2C+Chicago%2C+IL+60618&key=1234567890

### distancematrix

Proxies access to the [Distance Matrix API](https://developers.google.com/maps/documentation/distancematrix/).

http://services.smartchicagoapps.org/v1/maps/distancematrix?origins=2401+N+Lake+Shore+Dr,+Chicago,+IL,+USA&destinations=50+W+Washington+St,+Chicago,+IL,+USA&sensor=false&mode=bicycling&units=imperial&key=1234567890

## Team

* Scott Robbin scott@robbin.co
* Dan O'Neil doneil@cct.org