class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy #delete comments if article is destroyed
  validates :title, presence: true, length: { minimum: 5 }
end
