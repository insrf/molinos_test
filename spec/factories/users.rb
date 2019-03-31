FactoryBot.define do
  factory :user do
    email { "MyString@email.com" }
    password { "MyString" }
    password_confirmation { "MyString" }
  end
end
