class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :delivery_fee

  belongs_to :user
  has_one :item_purchase
  has_one_attached :image

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :shipping_day_id
    validates :shipping_origin_id
    validates :delivery_fee_id
  end

  with_options presence: true do
    validates :name
    validates :text
  end

  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  validate :was_attached?
  def was_attached?
    errors.add(:image, 'ファイルを添付してください') unless image.attached?
  end
end
