class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :rooms
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true,
  length: { maximum: 20 },
  format: { with: /\A[a-zA-Z0-9_\.]*\z/, message: "名前は英字、数字、アンダースコア、ピリオドのみが使用できます。" }

  validates :password, presence: true, on: :create

  mount_uploader :image_name, AvatarUploader

  before_create :set_default_image

  private

  def set_default_image
    self.image_name ||= 'default_user.jpg'
  end

end
