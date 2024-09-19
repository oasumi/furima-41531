FactoryBot.define do
  factory :user do
    nickname { 'asumi' }
    email { 'test@example' }
    password { 'test1234' }
    password_confirmation { password }
    last_name { '小野' }
    first_name { '愛純' }
    last_name_kana { 'オノ' }
    first_name_kana { 'アスミ' }
    birth_date { '1990-01-01' }
  end
end
