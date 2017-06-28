class Post < ApplicationRecord
  belongs_to :user
  belongs_to :city, optional:true


end
