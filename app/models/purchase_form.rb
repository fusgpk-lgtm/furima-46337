class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :city, :house_number, :house_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only numbers' },
                             length: { in: 10..11, message: 'is too short' }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      purchase_record = PurchaseRecord.create!(user_id: user_id, item_id: item_id)
      ShoppingInformation.create!(post_number: post_number, prefecture_id: prefecture_id, city: city, house_number: house_number,
                                  house_name: house_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
    end
    true
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error("PurchaseForm save failed: #{e.message}")
    false
  end
end
