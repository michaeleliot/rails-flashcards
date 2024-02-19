class CreateReviewEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :review_events do |t|
      t.string :user_id
      t.datetime :datetime

      t.timestamps
    end
  end
end
