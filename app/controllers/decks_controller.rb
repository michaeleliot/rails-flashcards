class DecksController < ApplicationController
  before_action :authenticate_user!

  before_action :find_deck, only: [:show, :reset, :update, :edit, :destroy, :done, :study]

  def index
    @user_decks = current_user.decks
    @decks = Deck.where(user_id: nil)
  end

  def show
  end

  def reset
    @deck.cards.each do |card|
      card.update(review_time: Time.now)
    end
    redirect_to @deck
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.build(deck_params)

    if @deck.save
      redirect_to @deck
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @deck.update(deck_params)
      redirect_to @deck
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @deck.destroy
    redirect_to root_path, status: :see_other
  end

  def done
  end

  def study
    @current_card = @deck.cards_to_review.first
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :description)
  end

  def find_deck
    @deck = Deck.find(params[:id])
    unless current_user_has_access_to_deck
      flash[:alert] = "You do not have access to view this deck."
      redirect_to root_path, status: :forbidden
    end
  end

  def current_user_has_access_to_deck
    @deck.user == current_user || @deck.user == nil
  end
end
