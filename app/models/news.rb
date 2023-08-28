class News < ApplicationRecord
  belongs_to :state
  belongs_to :city
  belongs_to :category
  has_many_attached :images
   has_many_attached :videos

  def image_urls
    images.map do |image|
      Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
    end
  end
  # validates :title, presence: { message: "Title can't be blank" },
  # length: { maximum: 50, message: "Title is too long (maximum is 50 characters)" }
  # validates :headlines, presence: { message: "Title can't be blank" },
  # length: { maximum: 50, message: "Title is too long (maximum is 50 characters)" }


end
