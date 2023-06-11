class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :name, presence: true
  validates :details, presence: true
  validates :price, presence: true
  validates :address, presence: true

  mount_uploader :image_name, RoomImageUploader

  def self.search(address_keyword, details_keyword)
    where(["address like?", "%#{address_keyword}%"]).where(["name like? OR details like?", "%#{details_keyword}%", "%#{details_keyword}%"])
  end
end
