FactoryBot.define do
  factory :address do
    postal_code { "123-4567" }
    region { 2 } # Example region ID
    purchase
  end
end
