class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :wine, optional: true
  has_many :comments
  validates :user_id, presence: :true
end
