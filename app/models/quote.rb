class Quote < ActiveRecord::Base

  belongs_to :user

  has_many :votes, dependent: :destroy
  has_many :voting_users, through: :votes, source: :user

  validates :body, presence: true

  def vote_result
    votes_relation = votes
    positive = votes_relation.select { |v| v.is_up == true }.length
    negative = votes_relation.length - positive
    positive - negative
  end

  def vote_for user
    votes.find_by_user_id user
  end
end
