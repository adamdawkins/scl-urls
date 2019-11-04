class Derivative < ApplicationRecord
  belongs_to :bodytype
  belongs_to :model

  extend FriendlyId
  friendly_id :name, use: :slugged
end
