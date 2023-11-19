# frozen_string_literal: true

require 'rspec'

RSpec.describe Portal1C::Client do
  let(:api) { described_class.new(ENV.fetch('PORTAL1C_API_LOGIN', 'fake'), ENV.fetch('PORTAL1C_API_PASSWORD', 'fake')) }
  let(:reg_nums) { [801_895_197, 20_016_806_416, 800_129_572] }
  let(:logins) { ['foobar@example.com', 'foo@example.com', 'bar@example.com'] }
  let(:codes) { %w[CL-12382 CL-898382 CL-932992] }

  it 'has api portal 1C' do
    expect(api).to be_an_instance_of(described_class)
  end

  specify '#check_its_by_reg_num' do
    data = VCR.use_cassette('api/check_its_by_reg_num') do
      api.check_its_by_reg_num(reg_nums)
    end
    expect(data.length).to eq(3)
  end

  specify '#check_its_by_subscriber_code' do
    data = VCR.use_cassette('api/check_its_by_subscriber_code') do
      api.check_its_by_subscriber_code(codes)
    end
    expect(data.length).to eq(3)
  end

  specify '#check_its_by_login' do
    data = VCR.use_cassette('api/check_its_by_login') do
      api.check_its_by_login(logins)
    end
    expect(data.length).to eq(3)
  end

  specify '#subscriber' do
    data = VCR.use_cassette('api/subscriber') do
      api.subscriber(page: 0, size: 1)
    end
    expect(data['size']).to eq(1)
    expect(data['page']).to eq(0)
  end

  specify '#billing_report' do
    data = VCR.use_cassette('api/billing_report') do
      api.billing_report(type: 'CLOUD_BACKUP', subscriber_code_list: codes)
    end
    expect(data).to be_an_instance_of(Hash)
    expect(data['reportUeid']).to be_an_instance_of(String)
  end

  specify '#get_billing_report' do
    data = VCR.use_cassette('api/get_billing_report') do
      billing_report = api.billing_report(type: 'CLOUD_BACKUP', subscriber_code_list: codes)
      api.get_billing_report(billing_report['reportUeid'])
    end
    expect(data['state']).to eq('OK')
  end

  specify '#check_industry_by_subscriber_code' do
    program_accesses = VCR.use_cassette('api/check_industry_by_subscriber_code') do
      api.check_industry_by_subscriber_code(['CL-46015'])
    end
    expect(program_accesses.first['status']).to eq('EmptyList')
    expect(program_accesses.first['code']).to eq(106)
  end

  specify '#programs' do
    data = VCR.use_cassette('api/programs') do
      api.programs
    end
    expect(data.length).to be > 0
  end

  specify '#check_industry_by_reg_num' do
    data = VCR.use_cassette('api/check_industry_by_reg_num') do
      api.check_industry_by_reg_num(reg_nums)
    end
    expect(data.length).to eq(reg_nums.length)
  end

  specify '#check_industry_by_login' do
    data = VCR.use_cassette('api/check_industry_by_login') do
      api.check_industry_by_login(logins)
    end
    expect(data.length).to eq(3)
  end

  specify '#program_versions' do
    data = VCR.use_cassette('api/program_versions') do
      api.program_versions(cursor: 0, nick: 'CRM')
    end
    expect(data.length).to be > 0
  end

  specify '#get_nomencluture_by_reg_numbers' do
    data = VCR.use_cassette('api/get_nomencluture_by_reg_numbers') do
      api.get_nomencluture_by_reg_numbers(reg_nums)
    end
    expect(data.length).to eq(reg_nums.length)
  end

  specify '#client_program_access_by_reg_number' do
    reg_num = 801_895_197
    program_accesses = VCR.use_cassette('api/client_program_access_by_reg_number') do
      api.client_program_access_by_reg_number(reg_number: reg_num)
    end
    expect(program_accesses).to be_an_instance_of(Array)
    expect(program_accesses.length).to eq(3)
    program_accesses.each do |description|
      expect(description['regNumber']).to eq(reg_num)
    end
  end

  specify '#client_program_access_by_login' do
    data = VCR.use_cassette('api/client_program_access_by_login') do
      api.client_program_access_by_login(login: 'test')
    end
    expect(data.length).to eq(0)
  end
end
