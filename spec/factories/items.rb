FactoryBot.define do
  factory :item do
    items_name
    explanation
    category_id
    situation_id
    delivery_charge_id
    prefecture_id
    days_to_ship_id
    price
    user
  end
end
