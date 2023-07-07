FactoryBot.define do
  factory :item do
    item_name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    detail_category_id { 2 } # Replace with the appropriate value
    detail_condition_id { 2 } # Replace with the appropriate value
    delivery_format_id { 2 } # Replace with the appropriate value
    region_id { 2 } # Replace with the appropriate value
    arrival_id { 2 } # Replace with the appropriate value
    price { 500 } # Replace with the appropriate value
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/images/item.jpg'), 'image/jpeg') }
    association :user

    # Other associations or attributes if needed
    trait :invalid do
      item_name { nil }
      # Add other attributes that should make the item invalid
    end
  end
end
