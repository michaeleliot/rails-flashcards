class AddUserIdToReviewEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :review_events, :user_id, :bigint
    add_reference :review_events, :user, null: false, foreign_key: true
  end
end
