class Post < ApplicationRecord
  belongs_to :user                   
  belongs_to :city, optional:true
  validates :title, presence: true, length: { maximum: 200, minimum: 1 }
  validates :post, presence: true
  validates :img, presence: true
end
