class CardsController < ApplicationController
  before_action :authenticate_user!

  before_action :find_deck

  include AccessRequired

  def edit
    @card = Card.find(params[:id])
  end

  def new
    @card = @deck.cards.build
  end
  
  def create
    @card = @deck.cards.create(card_params)
    redirect_to deck_path(@deck)
  end

  def next
    finished_card = Card.find(params[:id])

    current_card_index = @deck.cards_to_review(current_user).find_index(finished_card)
    next_card_index = current_card_index + 1
    @current_card = @deck.cards_to_review(current_user)[next_card_index]

    review_time = params[:review_time]
    finished_card.update_review_time(Time.parse(review_time), current_user)

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
    if params[:deck_id]
      @deck = Deck.find(params[:deck_id])
    end
  end

end

