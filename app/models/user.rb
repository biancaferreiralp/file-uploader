class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :company_sales
  has_many :merchants, -> { distinct }, through: :company_sales
  has_many :purchasers, -> { distinct }, through: :company_sales
end
