class Wine < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id,
            :name,
            :winery,
            :vintage,
            :origin,
            :price,
            :rating,
            :tasting_notes, presence: true
end
