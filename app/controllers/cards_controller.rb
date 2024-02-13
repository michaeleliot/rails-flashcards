class CardsController < ApplicationController
  before_action :authenticate_user!

  before_action :find_deck

  def edit
    @card = Card.find(params[:id])
  end
  
  def create
    @card = @deck.cards.create(card_params)
    redirect_to deck_path(@deck)
  end

  def next
    finished_card = Card.find(params[:id])

    current_card_index = @deck.cards_to_review.find_index(finished_card)
    next_card_index = current_card_index + 1
    @current_card = @deck.cards_to_review[next_card_index]

    review_time = params[:review_time]
    finished_card.update(review_time: Time.parse(review_time))

    if @current_card
      render "decks/study"
    else
      render "decks/done"
    end
  end

  def set_reviewed
    @card = Card.find(params[:id])
    @card.update(time_to_review: Time.parse(params[:time_to_review]))

    head :no_content # Respond with a 204 No Content status
  end

  def destroy
    @card = @deck.cards.find(params[:id])
    @card.destroy
    redirect_to deck_path(@deck), status: :see_other
  end

  private

  def card_params
    params.require(:card).permit(:question, :answer, :question_image, :answer_image)
  end

  def find_deck
    @deck = Deck.find(params[:deck_id])
    unless current_user_has_access_to_deck
      flash[:alert] = "You do not have access to view this deck."
      redirect_to root_path, status: :forbidden
    end
  end

  def current_user_has_access_to_deck
    @deck.user == current_user || @deck.user == nil
  end
end

