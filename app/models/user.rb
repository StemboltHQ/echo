class User < ActiveRecord::Base

  has_secure_password

  has_many :quotes, dependent: destroy
  has_many :votes, dependent: destroy
  has_many :voted_quotes, through: :votes, source: :quote

  validates :email, presence: true, uniqueness: true,
          format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
end
