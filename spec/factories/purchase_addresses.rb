FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    region_id { 1 }
    city { 'さいたま市' }
    address_no { '1-1' }
    building_no { 'ハイツ東京' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
