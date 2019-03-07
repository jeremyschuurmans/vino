class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true, optional: true
  belongs_to :user, optional: true
  belongs_to :wine, optional: true
  has_many :comments, as: :commentable
  validates :user_id, presence: :true
end
