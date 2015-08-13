class Article < ActiveRecord::Base

  has_many :comments

  validates :title, presence: true
  validates :description, presence: true
  validates :title, length: { minimum: 5 }
  # did have length starting at 30, but broke lots of other tests
  # revisit and fix other tests so can have length minimum of 30, so there has to be something in description
  # validates :description, length: { in: 0..500 }
end
