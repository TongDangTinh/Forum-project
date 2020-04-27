class Reply < ApplicationRecord
  belongs_to :discussion
  belongs_to :user

  validates :reply, presence: true

  extend FriendlyId
  friendly_id :reply, use: :slugged
end
