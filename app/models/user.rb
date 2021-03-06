class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true, length: {maximum: 20}

  has_many :books, dependent: :destroy

  def email_required?
  	false
  end

  def email_changed?
  	false
  end
end
