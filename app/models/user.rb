class User < ApplicationRecord
  has_many :access_tokens, dependent: :destroy
  has_many :auth_tokens, dependent: :destroy

  after_create :generate_auth_token

  validates :email, presence: true, uniqueness: true

  def generate_auth_token
    AuthToken.create(user: self)
  end
end
