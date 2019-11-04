class Model < ApplicationRecord
  belongs_to :model_range

  has_many :derivatives, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :model_range }
  validates :slug, presence: true, uniqueness: { scope: :model_range }

  extend FriendlyId
  friendly_id :name, use: :scoped, scope: :model_range

  default_scope { order(name: :asc) }
end
