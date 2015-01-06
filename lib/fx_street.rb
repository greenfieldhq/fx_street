require "fx_street/client"
require "fx_street/version"

module FXStreet
  autoload :Stripify, 'fx_street/response/stripify'

  Faraday::Response.register_middleware stripify: lambda { Stripify }
end
