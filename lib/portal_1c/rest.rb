# frozen_string_literal: true

module Portal1C
  module Rest
    include Portal1C::Request

    def check_its_by_subscriber_code(subscriber_codes)
      post(
        'api/rest/public/subscription/checkItsBySubscriberCode',
        self,
        { subscriberCodeList: subscriber_codes }
      )
    end

    def check_its_by_reg_num(reg_numbers)
      post(
        'api/rest/public/subscription/checkItsByRegNum',
        self,
        { regNumberList: reg_numbers }
      )
    end

    def check_its_by_login(logins)
      post(
        'api/rest/public/subscription/checkItsByLogin',
        self,
        { loginList: logins }
      )
    end

    def subscriber(body)
      post(
        'api/rest/public/subscriber',
        self,
        body
      )
    end

    def billing_report(body)
      post(
        'api/rest/public/option/billing-report',
        self,
        body
      )
    end

    def get_billing_report(report_id)
      get(
        "api/rest/public/option/billing-report/#{report_id}",
        self
      )
    end

    def check_industry_by_subscriber_code(subscriber_codes)
      post(
        'api/rest/public/industry/checkIndustryBySubscriberCode',
        self,
        { subscriberCodeList: subscriber_codes }
      )
    end

    def check_industry_by_reg_num(reg_numbers)
      post(
        'api/rest/public/industry/checkByRegNum',
        self,
        { regNumberList: reg_numbers }
      )
    end

    def check_industry_by_login(logins)
      post(
        'api/rest/public/industry/checkByLogin',
        self,
        { loginList: logins }
      )
    end

    def program_versions(cursor:, nick:)
      post(
        'api/program-versions',
        self,
        { cursor:, nick: }
      )
    end

    def programs
      get(
        'api/programs',
        self
      )
    end

    def get_nomencluture_by_reg_numbers(reg_numbers)
      post(
        'api/nomenclature/getByRegNumbers',
        self,
        reg_numbers
      )
    end

    def client_program_access_by_reg_number(reg_number:)
      post(
        'api/client-program-access/search/reg-number',
        self,
        { regNumber: reg_number }
      )
    end

    def client_program_access_by_login(login:)
      post(
        'api/client-program-access/search/login',
        self,
        { login: }
      )
    end

    def users(body)
      post(
        'api/users',
        self,
        body
      )
    end
  end
end
