class CreateReviewEvents2 < ActiveRecord::Migration[7.1]
  def change
    create_table :review_events2s do |t|
      t.references :user, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.datetime :reviewed_at
      t.integer :score

      t.timestamps
    end
  end
end
