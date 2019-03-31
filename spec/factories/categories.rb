FactoryBot.define do
  factory :category do
    name { "MyString" }
    parent_id { 1 }
  end

  factory :invalid_category, class: "Category"  do
    name { nil }
    parent_id { nil }
  end
end
