class Post < ActiveRecord::Base
  scope :ordered, -> { order('created_at DESC') }
end
