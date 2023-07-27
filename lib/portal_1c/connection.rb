# frozen_string_literal: true

module Portal1C
  module Connection
    BASE_URL = 'https://partner-api.1c.ru/'

    def connection(client)
      Faraday.new(options) do |faraday|
        faraday.request :authorization, :basic, client.login, client.password
        faraday.adapter Faraday.default_adapter
      end
    end

    private

    def options
      {
        headers: {
          'content-type': 'application/json'
        },
        url: BASE_URL
      }
    end
  end
end
