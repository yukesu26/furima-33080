require 'rails_helper'
 RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
 describe '商品の出品' do
    context "商品が保存できる場合" do
      it "全ての項目が存在すれば保存される" do
        expect(@product).to be_valid
      end
    end
  end
  context "商品が保存できない場合" do
    it "商品名が空では登録できない" do
      @product.name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "商品名が40文字以上では登録できない" do
      @product.name = '11111111111111111111111111111111111111111'
      @product.valid?
      expect(@product.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
    end
    it "商品説明が空では登録できない" do
      @product.memo = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Memo can't be blank")
    end
    it "カテゴリーが空では登録できない" do
      @product.category_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Category must be other than 1")
    end
    it "商品の状態が空では登録できない" do
      @product.item_state_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Item state must be other than 1")
    end
    it "配送料の負担が空では登録できない" do
      @product.delivery_fee_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Delivery fee must be other than 1")
    end
    it "発送元が空では登録できない" do
      @product.shipping_place_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipping place must be other than 1")
    end
    it "発送までの日数が空では登録できない" do
      @product.send_day_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Send day must be other than 1")
    end
    it "販売価格が空では登録できない" do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not a number")
    end
    it "販売価格が300円以下では登録できない" do
      @product.price = '299'
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be greater than 300")
    end
    it "販売価格が9999999円以上では登録できない" do
      @product.price = '10000000'
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be less than 9999999")
    end
    it "価格が全角数字では登録できない" do
      @product.price = '１０００'
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not a number")
    end
    it "商品説明が1000文字以上では登録できない" do
      @product.memo = 'ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ'
      @product.valid?
      expect(@product.errors.full_messages).to include("Memo is too long (maximum is 1000 characters)")
    end
    it "出品画像が空では登録できない" do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end

  end
end