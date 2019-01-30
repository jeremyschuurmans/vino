class Wine < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
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
