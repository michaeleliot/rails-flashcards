class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  belongs_to :user

  def cards_not_to_review(current_user)
    sql = <<-SQL
      SELECT cards.*
      FROM cards
      LEFT JOIN review_events ON cards.id = review_events.card_id AND review_events.user_id = ?
      WHERE cards.deck_id = ? AND review_events.reviewed_at >= ?
    SQL
    Card.find_by_sql [sql, current_user.id, id, Time.now]
  end

  def cards_to_review(current_user)
    # cards.where('review_time <= ?', Time.now)
    sql = <<-SQL
      SELECT cards.*
      FROM cards
      LEFT JOIN review_events ON cards.id = review_events.card_id AND review_events.user_id = ?
      WHERE cards.deck_id = ? AND (review_events.id IS NULL OR review_events.reviewed_at < ?)
    SQL
    Card.find_by_sql [sql, current_user.id, id, Time.now]
  end

end
