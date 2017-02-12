class User < ApplicationRecord

 # before_filter :signed_in_user, only: [:edit, :update]
 #  before_action :authenticate_user!
  has_many :things, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :maps, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save { self.email = email.downcase }
  before_save { self.name = name.downcase }

  VALID_NAME_REGEX = /\A([\w]+\_?[\w]+)*\z/i
  validates :name,  presence: true, format: { with: VALID_NAME_REGEX }, uniqueness: { case_sensitive: false }, length: { in: 3..18 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false },length: { maximum: 100 }

  validates :password, presence: true, length: { minimum: 6 }
  validates :description, allow_blank: true, length: { maximum: 1000 }
end
