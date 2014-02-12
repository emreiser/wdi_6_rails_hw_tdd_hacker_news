class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_many :votes, as: :votable

  validates :body, presence: true
  validates :article_id, presence: true
  validates :user_id, presence: true

  def get_votes
  	self.votes.where(up: true).count
  end

end
