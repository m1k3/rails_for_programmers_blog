class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :body, presence: :true

  def author?(current_user)
    user == current_user
  end
end
