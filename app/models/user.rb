class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :chats, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6, message: "must be at least 6 characters" }
  validates :password_confirmation, presence: true, if: -> { password.present? }
end
