class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :city, :house_number, :house_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)', allow_blank: true }
    validates :city
    validates :house_number
    validates :phone_number
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :token
  end

  validates :phone_number, format: { with: /\A\d+\z/, message: 'is invalid. Input only numbers' }
  validates :phone_number, length: { minimum: 10, maximum: 11, too_short: 'is too short', too_long: 'is too long' }

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
    errors.add(:base, "An error occurred during the transaction: #{e.message}") # エラーをモデルに追加
    false
  end
end
