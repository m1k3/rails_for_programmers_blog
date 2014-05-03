class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  scope :ordered, -> { order('created_at DESC') }

  def author?(current_user)
    user == current_user
  end
end
