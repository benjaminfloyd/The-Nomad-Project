class Post < ApplicationRecord
  belongs_to :user                   
  belongs_to :city, optional:true
  validates :title, presence: true, length: { maximum: 50, minimum: 1 }
  validates :post, presence: true, length: { maximum: 500, minimum: 1 }
  validates :img, allow_blank: true, format: {
  with: %r{\.gif|jpg|png}i,
  message: 'must be a url for gif, jpg, or png image.'
}
end
