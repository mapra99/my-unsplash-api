class Post < ApplicationRecord
  has_one_attached :image

  validates_presence_of :title

  def image_url
    image.attached? ? image.service_url : ''
  end
end
