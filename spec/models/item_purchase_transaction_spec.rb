require 'rails_helper'

RSpec.describe ItemPurchaseTransaction, type: :model do
  describe "購入情報の保存" do
    before do
      @item_purchase_transaction = FactoryBot.build(:item_purchase_transaction)
    end

    it 'postalcodeが空だと保存できないこと' do
      @item_purchase_transaction.postalcode = nil
      @item_purchase_transaction.valid?
      expect(@item_purchase_transaction.errors.full_messages).to include("Postalcode can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @item_purchase_transaction.postalcode = ”1234567”
      @item_purchase_transaction.valid?
      expect(@item_purchase_transaction.errors.full_messages).to include("Postalcode is invalid. Include hyphen(-)")
    end
    it 'shipping_origin_idを選択していないと保存できないこと' do
      @item_purchase_transaction.shipping_origin_id = 1
      @item_purchase_transaction.valid?
      expect(@item_purchase_transaction.errors.full_messages).to include("Shipping origin can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @item_purchase_transaction.city = nil
      @item_purchase_transaction.valid?
      expect(@item_purchase_transaction.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @item_purchase_transaction.house_number = nil
      @item_purchase_transaction.valid?
      expect(@item_purchase_transaction.errors.full_messages).to include("House number can't be blank")
    end
    it 'telephoneが空だと保存できないこと' do
      @item_purchase_transaction.telephone = nil
      @item_purchase_transaction.valid?
      expect(@item_purchase_transaction.errors.full_messages).to include("Telephone can't be blank")
    end
    it 'telephoneにはハイフンは不要であること' do
      @item_purchase_transaction.telephone = ’090-1111-2222’
      @item_purchase_transaction.valid?
      expect(@item_purchase_transaction.errors.full_messages).to include("Telephone is invalid. ")
    end
    it 'telephoneは11桁以内であること' do
      @item_purchase_transaction.telephone = ’090011112222’
      @item_purchase_transaction.valid?
      expect(@item_purchase_transaction.errors.full_messages).to include("Telephone is invalid. ")
    end
  end
end
