class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    #@num = 0
    user = User.find(session[:user_id])

    if User.where(vote: nil).count.zero?
      redirect_to user_path(user.id)
    else
      render :index
    end

  #    User.all.each do |user|
  #    @num = @num.to_i + 1
  #    if (user.vote.present? && @num == User.count)
  #    redirect_to user_path(user.id)
  #  end
  #    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @users = User.all

  end



  # GET /users/new
  def new
    @user = User.new
  end




  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.find_or_initialize_by(name: params[:user][:name])
#    @user = User.find_by(name: params[:user][:name]) || User.new(name: params[:user][:name])
    @user.save!
    session[:user_id] = @user.id
    redirect_to votes_path

    # @user = User.new(user_params)
    #
    # respond_to do |format|
    #   if @user.save
    #      format.html { redirect_to @user, notice: 'User was successfully created.' }
    #      format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :vote)
    end
end
