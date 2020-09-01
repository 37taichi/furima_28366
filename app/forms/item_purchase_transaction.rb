class ItemPurchaseTransaction

  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id,  :postalcode, :shipping_origin_id, :city, :house_number, :building, :telephone

  with_options presence: true do
    validates :postalcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :house_number
    validates :telephone, format: {with: /\A\d{10,11}\z/, message: "is invalid. "}
    validates :token
  end

  def save
    @item_purchase = ItemPurchase.new(user_id: user_id, item_id: item_id)
    @item_purchase.save!
    Address.create(postalcode: postalcode, shipping_origin_id: shipping_origin_id, city: city, house_number: house_number, building: building, telephone: telephone, item_purchase_id: @item_purchase.id)
  end

end