class Wine < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy, inverse_of: :wine, foreign_key: 'wine_id'
  has_one :user, through: :comments
  default_scope -> { order(created_at: :desc) }
  validates :name,
            :winery,
            :vintage,
            :origin,
            :price,
            :rating,
            :tasting_notes, presence: true

end
