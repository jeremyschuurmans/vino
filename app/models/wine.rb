class Wine < ApplicationRecord
  belongs_to :user
  validates :user_id,
            :name,
            :winery,
            :vintage,
            :origin,
            :price,
            :rating,
            :tasting_notes, presence: true

end
