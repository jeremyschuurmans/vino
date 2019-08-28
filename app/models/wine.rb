<<<<<<< HEAD
class Wine < ActiveRecord::Base
  belongs_to :user
=======
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

>>>>>>> 838f433e9496433f5afd2ec9171af631f6972d9a
end
