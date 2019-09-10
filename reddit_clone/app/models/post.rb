class Post < ApplicationRecord
  validates :title, presence: true
  # validates :post_subs, presence: true


  has_many :post_subs, dependent: :destroy, inverse_of: :post
  
  has_many :subs,
  through: :post_subs,
  source: :sub
  
  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User
  



  


end