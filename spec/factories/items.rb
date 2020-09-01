FactoryBot.define do
  factory :item do
    name                 { 'ロゴ' }
    text                 { '説明' }
    category_id          { 2 }
    status_id            { 2 }
    price                { 4649 }
    shipping_day_id      { 2 }
    shipping_origin_id   { 2 }
    delivery_fee_id      { 2 }
    association :user
  end
end
