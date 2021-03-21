class Post < ApplicationRecord
  has_one_attached :image

  def image_url
    image.attached? ? ActionController::Base.url_for(image) : ''
  end
end
