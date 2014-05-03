class Post < ActiveRecord::Base
  has_many :comments
  scope :ordered, -> { order('created_at DESC') }
end
