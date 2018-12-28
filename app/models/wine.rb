class Wine < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id,
            :name,
            :winery,
            :vintage,
            :origin,
            :price,
            :rating,
            :tasting_notes, presence: true
  validate  :picture_size

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "file should be less than 5MB")
      end
    end
end
