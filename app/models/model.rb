class Model < ApplicationRecord
  belongs_to :model_range

  has_many :derivatives, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged
end
