class DecksController < ApplicationController
  before_action :authenticate_user!

  before_action :find_deck

  include AccessRequired

  def index
    @user_decks = current_user.decks
    @decks = Deck.where(is_public: true).where.not(user: current_user)
  end

  def show
  end

  def reset
    @deck.cards.each do |card|
      card.update_review_time(Time.now, current_user)
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
    @current_card = @deck.cards_to_review(current_user).first
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :description, :is_public)
  end

  def find_deck
    if params[:id]
      @deck = Deck.find(params[:id])
    end
  end

  
end
