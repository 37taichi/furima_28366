class Address < ApplicationRecord
  belongs_to :item_purchase
  # with_options presence: true do
  #   validates :postalcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #   validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
  #   validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  #   validates :house_number,
  #   validates :telephone, format: {with: /\A[0-9]{11}\z/, message: "is invalid. "}
  # end

  # validates :building

end
