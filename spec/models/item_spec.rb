require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/EepTX5qVoAAuwLV.jpeg')
  end

  describe '商品出品' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end
    it "画像は1枚必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image ファイルを添付してください")
    end
    it "nameが空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "textが空だと登録できない" do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'category_idを選択していないと保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'status_idを選択していないと保存できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it 'shipping_days_idを選択していないと保存できないこと' do
      @item.shipping_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days can't be blank")
    end
    it 'shipping_origin_idを選択していないと保存できないこと' do
      @item.shipping_origin_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
    end
    it 'delivery_fee_idを選択していないと保存できないこと' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end
    it 'priceが空だと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが300円未満では保存できないこと' do
      @item.price = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it 'priceが9,999,999円を超過すると保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
  end
end
