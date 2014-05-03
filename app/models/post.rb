class Post < ActiveRecord::Base
  include Authorable

  has_many :comments
  scope :ordered, -> { order('created_at DESC') }
end
