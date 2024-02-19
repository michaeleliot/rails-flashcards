class AddCardRefToReviewEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :review_events, :card, null: false, foreign_key: true
  end
end
