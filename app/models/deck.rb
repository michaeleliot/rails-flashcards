class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  belongs_to :user

  def cards_not_to_review
    cards.where('review_time > ?', Time.now)
  end

  def cards_to_review
    cards.where('review_time <= ?', Time.now)
  end

end
