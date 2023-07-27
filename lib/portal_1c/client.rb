# frozen_string_literal: true

module Portal1C
  class Client
    include Portal1C::Rest

    attr_reader :login, :password

    def initialize(login, password)
      @login = login
      @password = password
    end
  end
end
