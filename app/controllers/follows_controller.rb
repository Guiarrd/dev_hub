class FollowsController < ApplicationController
  before_action :set_user
  
  def create
    respond_to do |format|
      if current_user.follow(@user)
        format.json { render @user, status: :created }
        format.html { redirect_back fallback_location: root_path, notice: 'Agora você está seguindo este usuário.' }
      else
        format.json { render json: nil, status: :unprocessable_entity }
        format.html { redirect_back fallback_location: root_path }
      end
    end
  end

  def destroy
    respond_to do |format|
      if current_user.stop_following(@user)
        format.json { head :no_content }
        format.html { redirect_back fallback_location: root_path, notice: 'Você deixou de seguir este usuário.' }
      else
        format.json { render json: nil, status: :unprocessable_entity }
        format.html { redirect_back fallback_location: root_path }
      end
    end
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end
end
