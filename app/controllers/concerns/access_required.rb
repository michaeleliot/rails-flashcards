module AccessRequired
  extend ActiveSupport::Concern

  included do
    before_action :current_user_has_access_to_deck
  end
  private

  def current_user_has_access_to_deck
    if @deck
      unless @deck.user == current_user || @deck.is_public
        flash[:alert] = "You do not have access"
        redirect_to root_path, status: :forbidden
      end
    end
  end

end
