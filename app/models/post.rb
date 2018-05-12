class Post < ApplicationRecord
  validates :contents, presence: { message: "Must not be empty." }
  validates :contents, length: { maximum: 300, too_long: "%{count} characters is the maximum allowed." } 

  belongs_to :user
  has_many :comments
end
