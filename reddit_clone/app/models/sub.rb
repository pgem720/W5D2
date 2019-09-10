class Sub < ApplicationRecord
  validates :title, :description, presence: true

  has_many :post_subs, dependent: :destroy, inverse_of: :sub
  
  belongs_to :moderator,
  foreign_key: :user_id,
  class_name: :User

  has_many :posts,
  through: :post_subs,
  source: :post

  

end