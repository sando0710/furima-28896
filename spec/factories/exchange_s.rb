FactoryBot.define do
  factory :exchange_s do
    post_code     { '123-4567' }
    prefecture    { '1' }
    city          { '東京都' }
    address       { '1-1' }
    building      { '東京ハイツ' }
    phone_number  { '09088889999' }
    token         { 'tok_48c09e205d158d365b0a594e3aff' }
  end
end
