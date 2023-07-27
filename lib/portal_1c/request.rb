# frozen_string_literal: true

require 'json'

module Portal1C
  module Request
    include Portal1C::Connection

    def get(path, client, params = {})
      respond_with(connection(client).get(path, params))
    end

    def post(path, client, params = {})
      respond_with(connection(client).post(path, JSON.dump(params)))
    end

    private

    def respond_with(response)
      JSON.parse(response.body)
    end
  end
end
