class Channel < ApplicationRecord
  extend FriendlyId
  friendly_id :slug
end
