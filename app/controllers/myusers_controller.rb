class MyusersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @myuser = Myuser.new
  end


  def index
    # @myusers = Myuser.all
    @myusers = Myuser.paginate(page: params[:page], per_page: 3)
  end



  def show
    # @myuser = Myuser.find(params[:id])
    # @myarticles = @myuser.myarticles
    @myarticles = @myuser.myarticles.paginate(page: params[:page], per_page: 5)
  end

  def edit
      # @myuser = Myuser.find(params[:id])
  end
  
  def update
      # @myuser = Myuser.find(params[:id])
      if @myuser.update(myuser_params)
        flash[:notice] = "Your account information was successfully updated"
        redirect_to @myuser
      else
        render 'edit'
      end
  end

  def destroy
    @myuser.destroy
    # session[:user_id] = nil
    session[:user_id] = nil if @myuser == current_user
    flash[:notice] = "Account and all associated articles successfully deleted"
    redirect_to myarticles_path
  end


  def create
      @myuser = Myuser.new(myuser_params)
      if @myuser.save
        session[:user_id] = @myuser.id
        flash[:notice] = "Welcome to the Alpha Blog #{@myuser.username}, you have successfully signed up"
        redirect_to myarticles_path
      else
        render 'new'
      end
  end
  
  private
  def myuser_params
    params.require(:myuser).permit(:username, :email, :password)
  end

  def set_user
    @myuser = Myuser.find(params[:id])
  end

  def require_same_user
    # if current_user != @myuser
    #   flash[:alert] = "You can only edit your own account"
    if current_user != @myuser && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own account"

      redirect_to @myuser
    end
  end


end 