class Wine < ApplicationRecord
  has_many :comments, dependent: :destroy, inverse_of: :wine, foreign_key: 'wine_id'
  has_many :users, through: :comments
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
