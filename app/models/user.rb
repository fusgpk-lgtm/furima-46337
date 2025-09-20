class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は半角英数字を両方含めて設定してください' }

  has_many :items
end
