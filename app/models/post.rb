class Post < ApplicationRecord
  has_one_attached :image

  validates_presence_of :title

  scope :sorted_by_newest, -> { order(created_at: :desc) }

  def self.paginate(limit, offset)
    limit(limit).offset(offset)
  end

  def image_url
    image.attached? ? image.service_url : ''
  end
end
