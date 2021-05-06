class Post < ApplicationRecord
  include Paginable

  has_one_attached :image

  validates_presence_of :title

  scope :sorted_by_newest, -> { order(created_at: :desc) }

  def image_url
    return '' unless image.attached?

    image.url
  end
end
