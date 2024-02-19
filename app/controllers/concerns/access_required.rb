module AccessRequired
  extend ActiveSupport::Concern

  private

  def has_access
    if @deck
      unless @deck.user == current_user || @deck.is_public
        flash[:alert] = "You do not have access"
        redirect_to root_path, status: :forbidden
      end
    end
  end

  def is_owner
    if @deck
      unless @deck.user == current_user
        flash[:alert] = "You do not have permission"
        redirect_to root_path, status: :forbidden
      end
    end
  end

end
