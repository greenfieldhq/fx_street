module FXStreet
  class Stripify < Faraday::Response::Middleware
    def call(request_env)
      @app.call(request_env).on_complete do |response_env|
        strip_strings(response_env.body)
      end
    end

    private

    def strip_strings(body)
      body.each do |hash|
        hash.each do |key, val|
          hash[key] = val.strip if val.instance_of?(String)
        end
      end
    end
  end
end
