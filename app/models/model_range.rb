class ModelRange < ApplicationRecord
  belongs_to :manufacturer

  has_many :models, dependent: :destroy
  has_many :derivatives, through: :models

  extend FriendlyId
  friendly_id :name, use: :slugged
end
