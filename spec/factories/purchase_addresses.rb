FactoryBot.define do
  factory :purchase_address do
    postal_code { "123-4567" }
    region { 2 } # Example region ID
    item_id { 1 }
    user_id { 2 }
  end
end
