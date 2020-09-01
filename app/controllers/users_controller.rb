class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friendlist
    @friends = current_user.friends
  end 
  
  def show
    @user = User.find(params[:id])
  end

  def search
    if params[:user].present?
      @query_friends = User.search(params[:user])
      @query_friends = current_user.except_current_user(@query_friends)
      if @query_friends
          respond_to do |format|
              format.js { render partial: 'users/friend_result'}
          end
      else
          respond_to do |format|
              flash.now[:alert] = "Cannot find user that match #{params[:user]}"
              format.js { render partial: 'users/friend_result'}
          end
        end
    else
        respond_to do |format|
            flash.now[:alert] = "Please enter a valid name or email"
            format.js { render partial: 'users/friend_result'}
        end
        

    end
  end
end
