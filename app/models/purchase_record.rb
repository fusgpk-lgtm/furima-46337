class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shopping_information
end
