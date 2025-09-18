class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_from_id, presence: true
  validates :ship_day_id, presence: true
  validates :price, presence: true

  belongs_to :user
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_charge
  belongs_to :ship_from
end
