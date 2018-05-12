class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :contents, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed." }
end
