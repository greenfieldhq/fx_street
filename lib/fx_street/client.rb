require "digest/sha1"
require "faraday"
require "faraday_middleware"
require "rash"

module FXStreet
  class Client
    attr_reader :client_id, :client_secret

    def initialize(options={})
      @client_id     = options.fetch(:client_id)     { ENV["FX_STREET_CLIENT_ID"] }
      @client_secret = options.fetch(:client_secret) { ENV["FX_STREET_CLIENT_SECRET"] }
    end

    def event_dates(params={})
      get("eventdate/", params)
    end

    private

    def connection
      @connection ||= Faraday.new(host) do |conn|
        conn.request :json

        conn.response :rashify
        conn.response :json, content_type: /\bjson$/

        conn.adapter Faraday.default_adapter
      end
    end

    def default_params
      {
        f: "json",
        k: client_id,
        s: sha,
        t: timestamp,
        view: "day"
      }
    end

    def get(url, params={})
      connection.get(url, default_params.merge(params)).body
    end

    def host
      "http://calendar.fxstreet.com/"
    end

    def sha
      Digest::SHA1.hexdigest(client_secret + timestamp)
    end

    def timestamp
      @time ||= Time.now.utc.strftime("%Y%m%d%H%M")
    end
  end
end
