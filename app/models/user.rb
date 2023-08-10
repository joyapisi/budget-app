class User < ApplicationRecord
  has_many :clothes, dependent: :destroy, foreign_key: :user_id
  has_many :groups, dependent: :destroy, foreign_key: :user_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :email, presence: true, uniqueness: true
end
