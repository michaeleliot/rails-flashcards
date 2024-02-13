class Card < ApplicationRecord
  belongs_to :deck

  before_create :set_default_time_to_review
  
  has_one_attached :question_image, service: :local
  has_one_attached :answer_image, service: :local

  private

  def set_default_time_to_review
    self.review_time ||= Time.now
  end
end
