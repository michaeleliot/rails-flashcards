class RemoveUserIdFromReviewEvents < ActiveRecord::Migration[7.1]
  def change
    remove_reference :review_events, :user, index: true, foreign_key: true
    add_reference :cards, :user, index: true, foreign_key: true
  end
end
