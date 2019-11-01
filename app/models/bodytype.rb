class Bodytype < ApplicationRecord
  has_many :derivatives, dependent: :nullify
end
