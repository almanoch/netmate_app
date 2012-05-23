class MicromessagesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy
  
  def create
    @micromessage = current_user.micromessages.build(params[:micromessage])
    if @micromessage.save
      flash[:success] = "Micromessage created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end
  
  def destroy
    @micromessage.destroy
    redirect_to root_path
  end
  
  private
  
  def correct_user
    @micromessage = current_user.micromessages.find_by_id(params[:id])
    redirect_to root_path if @micromessage.nil?
  end
end