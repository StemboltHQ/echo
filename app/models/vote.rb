class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :quote

  validates :user_id, uniqueness: {scope: :quote_id}

  def is_up?
    is_up
  end
end
