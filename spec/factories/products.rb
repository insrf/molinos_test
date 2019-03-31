FactoryBot.define do
  factory :product do
    name { "MyString" }
    info { "MyString" }
    category_id { 1 }
  end

  factory :invalid_product, class: "Product" do
    name { nil }
    info { nil }
    category_id { nil }
  end
end
