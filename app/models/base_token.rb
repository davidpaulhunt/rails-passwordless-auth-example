class BaseToken < ApplicationRecord
  class << self
    attr_accessor :expires_after
  end

  self.expires_after = 1.day if self.expires_after.blank?

  self.abstract_class = true

  def self.expire_after(period)
    self.expires_after = period
  end

  belongs_to :user

  has_secure_token :token

  before_create :set_expires_at

  delegate :email, to: :user

  scope :active, -> { where('expires_at > ?', Time.now) }

  def set_expires_at
    self.expires_at = Time.now + self.class.expires_after
  end

  def expired?
    self.expires_at < Time.now
  end

  def expire!
    self.update(expires_at: Time.now)
  end
end
