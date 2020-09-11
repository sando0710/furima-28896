FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 8)
    password { password }
    password_confirmation { password }
    first_name { '田中' }
    last_name { '隆太郎' }
    first_name_kana { 'タナカ' }
    last_name_kana { 'リクタロウ' }
    birth_day { Date.today }
  end
end
