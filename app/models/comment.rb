class Comment < ActiveRecord::Base
  include Authorable

  belongs_to :post
  validates :body, presence: :true
end
