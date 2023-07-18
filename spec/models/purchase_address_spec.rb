require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe "validations" do
    it "validates the presence of item_id, user_id, and postal_code" do
      purchase_address = PurchaseAddress.new
      purchase_address.valid?
      
      expect(purchase_address.errors[:item_id]).to include("can't be blank")
      expect(purchase_address.errors[:user_id]).to include("can't be blank")
      expect(purchase_address.errors[:postal_code]).to include("can't be blank")
    end
    
    it "validates the format of postal_code" do
      purchase_address = PurchaseAddress.new(postal_code: "1234567")
      purchase_address.valid?
      
      expect(purchase_address.errors[:postal_code]).to include("is invalid. Include hyphen(-)")
    end
    
    it "validates that region cannot be blank" do
      purchase_address = PurchaseAddress.new(region_id: nil)
      purchase_address.valid?
      
      expect(purchase_address.errors[:region_id]).to include("can't be blank")
    end
    
    # Add more tests for other validations as per your requirements
    
    it "is valid with all required attributes" do
      purchase_address = PurchaseAddress.new(
        item_id: 1,
        user_id: 2,
        postal_code: "123-4567",
        region_id: 3,
        # Add other attributes as needed
      )
      
      expect(purchase_address).to be_valid
    end
  end
  
  describe "#save" do
    it "creates a new purchase and address record" do
      purchase_address = PurchaseAddress.new(
        item_id: 1,
        user_id: 2,
        postal_code: "123-4567",
        region_id: 3,
        # Add other attributes as needed
      )
      
      expect {
        purchase_address.save
      }
    end
  end
end
