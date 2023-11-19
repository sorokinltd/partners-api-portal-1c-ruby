# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'portal_1c'
  s.version     = '0.0.1'
  s.summary     = 'Portal 1C client'
  s.authors     = ['Anatoly Busygin']
  s.email       = 'anatolyb94@gmail.com'
  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.homepage    =
    'https://github.com/Suban05/partners-api-portal-1c-ruby'
  s.license = 'MIT'
end
