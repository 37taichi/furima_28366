FactoryBot.define do
  factory :item_purchase_transaction do
    postalcode          {"123-0033"}
    shipping_origin_id  {2}
    city                {"目黒区"}
    house_number        {"中根2-2"}
    telephone           {"08011112222"}
  end
end
