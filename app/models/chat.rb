class Chat < ApplicationRecord
  acts_as_chat
  belongs_to :user, optional: true
  has_many :messages, dependent: :destroy
end