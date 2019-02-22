class Experience < ApplicationRecord
  has_many :tastings
  has_many :users, through: :tastings
  
end
