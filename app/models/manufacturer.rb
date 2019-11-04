class Manufacturer < ApplicationRecord
  has_many :model_ranges, dependent: :destroy
  has_many :models, through: :model_ranges
  has_many :derivatives, through: :models

  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope { order(name: :asc) }
end
