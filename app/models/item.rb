class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: true
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_from_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true
  # 価格のバリデーションを数値関連に特化
  validates_numericality_of :price, only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999

  belongs_to :user
  has_one :purchase_record

  belongs_to :category
  belongs_to :state
  belongs_to :delivery_charge
  belongs_to :ship_from
  belongs_to :ship_day
  has_one_attached :image
end
