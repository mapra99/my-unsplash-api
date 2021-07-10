class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable # :confirmable, trackable

  # IMPORTANT: This line must be located AFTER the devise call
  include GraphqlDevise::Concerns::Model

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
