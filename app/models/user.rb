class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :name, presence: true
  # validates :profile, presence: true
  VALID_PASSWORD_REGEX = (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)
  validates :password, format: {with: VALID_PASSWORD_REGEX }

  has_many :posts
  has_many :comments
end
