class UsersController < ApplicationController

    before_action :authenticate_user!

    def index
        @user = User.new
        @users = User.all
        @book = Book.new
        @books = Book.all
    end

    def show
        # @user = User.find(params[:id])
        @user = User.find(params[:id])
        @book = Book.new
        @books = Book.all

    #   if @user.find(user_params)
    #     flash[:notice] = "Signed in successfully."
    #     redirect_to user_path(@user.id)
    #   else
    #     @users = User.all
    #     render :index
    #   end
    end

        # @profile_image_id = @user.post_images.page(params[:page]).reverse_order

#   def create  サインイン？
#       @user = User.new(user_params[:id])
#     if @user.save
#       flash[:notice] = "Welcome! You have signed up successfully."
#       redirect_to user_path(@user.id)
#     else
#       @users = User.all
#       render :index
#     end
#   end

    def edit
        @user = User.find(params[:id])
    #   if @user.id == current_user.id
    #     redirect_to edit_user_path(@user)
    #   else
    #     @users = User.all
    #     render :show
    #   end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)

        # if params[:image]
        #     #データベースに保存するファイル名はユーザーのid.jpgとする
        #     @user.profile_image_id = "#{@user.id}.jpg"
        #     image = params[:image]
        #     File.binwrite("assets/images/#{@user.profile_image_id}",image.read)
        # end
    end


    private
    def user_params
      params.require(:user).permit(:name , :profile_image, :introduction)
    end


end
