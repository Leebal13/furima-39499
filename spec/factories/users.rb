FactoryBot.define do
  factory :user do
    nickname { 'John' }
    email { 'john@example.com' }
    password { 'password123' }
    password_confirmation { 'password123' }
    first_name { 'John' }
    last_name { 'Doe' }
    kana_first_name { 'ジョン' }
    kana_last_name { 'ドウ' }
    birthdate { Date.new(1990, 1, 1) }
  end
end