class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy

  has_one_attached :shop_image

  has_one_attached :shop_in_image

  def get_shop_image(width, height)
    unless shop_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      shop_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    shop_image.variant(resize_to_limit: [width, height]).processed
  end

  def get_shop_in_image(width, height)
    unless shop_in_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      shop_in_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    shop_in_image.variant(resize_to_limit: [width, height]).processed
  end

end
