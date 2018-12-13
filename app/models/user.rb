class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: :true, length: {maximum: 100}
  validates :email, presence: :true,
                    length: {maximum: 100},
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }
end
