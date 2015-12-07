class Quote < ActiveRecord::Base

  belongs_to :user

  has_many :votes, dependent: :destroy
  has_many :voting_users, through: :votes, source: :user

  validates :body, presence: true

end
