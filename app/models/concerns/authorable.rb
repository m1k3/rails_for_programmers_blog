module Authorable
  extend ActiveSupport::Concern

  included do
    belongs_to :user
  end

  def author?(current_user)
    user == current_user
  end
end
