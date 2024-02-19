class Card < ApplicationRecord
  belongs_to :deck
  
  has_one_attached :question_image, service: :local
  has_one_attached :answer_image, service: :local
  has_many :review_event

  def update_review_time(new_review_time, current_user)
    review_event = ReviewEvent.find_or_initialize_by(user_id: current_user.id, card_id: id)
    review_event.reviewed_at = new_review_time
    review_event.save
  end

end
