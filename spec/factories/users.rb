FactoryBot.define do
  factory :user do
    nickname { 'John' }
    email {Faker::Internet.email}
    password { 'password123' }
    password_confirmation { 'password123' }
    first_name { '鈴木' }
    last_name { 'もやし' }
    kana_first_name { 'ジョン' }
    kana_last_name { 'ドウ' }
    birthdate { Date.new(1990, 1, 1) }

  end
end