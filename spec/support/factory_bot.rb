RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do

  factory :user do
    username "Joe"
    email "joe@gmail.com"
    password "blah"
  end
end
