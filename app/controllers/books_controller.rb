class BooksController < ApplicationController
  # before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!
  # before_action :set_book

  # def set_book
  #   # @book = current_user.books.find_by(id: params[:id])
  # #   @book = current_user.books.find(params[:id])
  # end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user

    # 本を投稿した全てのユーザー
  end

  def show
    @book2 = Book.find(params[:id])
    @book = Book.new
    @books = Book.all
    @user = @book2.user
    
    # redirect_to books_url if @book.blank?
    # @user2 = profile_image_id


  end

  def edit
      @book = Book.find(params[:id])
      # @book = Book.find(params[:id])
      if @book.user == current_user
        render "edit"
      else
        redirect_to books_path
      end

  end

  def update
      @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully.."
     redirect_to book_path(@book.id)
    else
      @books = Book.all
     render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def create
      @user = current_user
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      # ここがエラー
    if @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def list
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  # def correct_user
  #   user = User.find(params[:id])
  #   if current_user != user
  #     redirect_to root_path
  #   end
  # end
  
  # def correct_user
  #   @micropost = current_user.microposts.find_by(id: params[:id])
  #     unless @micropost
  #       redirect_to root_url
  #     end
  # end
  
end
