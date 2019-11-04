class Channel < ApplicationRecord
  validates :slug, :name, uniqueness: true, presence: true
  extend FriendlyId
  friendly_id :slug
end
