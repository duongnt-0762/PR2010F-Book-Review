class Favorite < ApplicationRecord
  belongs_to :book
  belongs_to :user
  delegate :name, :image, :display_image, :author_id, :author_name, :category_name, to: :book, prefix: :book, allow_nil: true
end
