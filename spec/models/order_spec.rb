require 'rails_helper'
 RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
 describe '商品の購入' do
  context "商品が購入できる場合" do
      it "全ての項目が存在すれば購入できる" do
        expect(@order).to be_valid
      end
      it "建物名が空でも購入できる" do
        @order.building_name = ''
        expect(@order).to be_valid
      end
      it "電話番号は10桁でも購入できる" do
        @order.phone_number = '0123456456'
        expect(@order).to be_valid
      end  
    end
  end
  context "商品が購入できない場合" do
    it "郵便番号が空では購入できない" do
      @order.post_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code can't be blank")
    end
    it "郵便番号にハイフンがなければ購入できない" do
      @order.post_code = '1113333'
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it "都道府県が空では購入できない" do
      @order.shipping_place_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Shipping place can't be blank")
    end
    it "市区町村が空では購入できない" do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it "番地が空では購入できない" do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号が空では購入できない" do
      @order.phone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号にハイフンがあると購入できない" do
      @order.phone_number = '090-1234-1234'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    it "電話番号は11桁以内でなければ購入できない" do
      @order.phone_number = '090123412345'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    it "郵便番号が英数混合だと購入できない" do
      @order.post_code = '1a2-b3c4'
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it "電話番号が英数混合では購入できない" do
      @order.phone_number = '090s345k432'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
