class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :city, optional:true, dependent: :destroy
  validates :title, presence: true, length: { maximum: 200, minimum: 1 }
  validates :post, presence: true
  validates :img, presence: true
end
