class Derivative < ApplicationRecord
  belongs_to :bodytype
  belongs_to :model

  enum transmission: { manual: 0, automatic: 1 }
  enum fueltype: { petrol: 0, diesel: 1 }

  extend FriendlyId
  friendly_id :capcode, use: :slugged
end
