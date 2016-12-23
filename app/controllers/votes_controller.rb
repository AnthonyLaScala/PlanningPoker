class VotesController < ApplicationController
  def index
    @votes = [1, 2, 3, 5, 8, 13]
    @user = User.find(session[:user_id])
    @users = User.all
    @all_has_voted = @users.all?(&:vote)
  end

  def new
  end

  def cast_vote
    @user = User.find(session[:user_id])
    @user.vote = params[:vote_num]
    @user.save!

  end

  def update
    User.all.update_all(vote: nil)
    redirect_to votes_path
  end

  def reset
    User.all.destroy_all
    redirect_to new_user_path
  end
end
