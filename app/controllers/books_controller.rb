class BooksController < ApplicationController
  
  def index
    # @books = Book.all
    # @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
      @book = Book.find(book_params[:id]) 
    # if @book.save
    #   flash[:notice] = "You have updated book successfully."
    #   redirect_to book_path(@book.id)
    # else
    #   @books = Book.all
    #   render :index
    # end
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
  
  def delete
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  def create
      @book = Book.new(book_params[:id])   
      # ここがエラー
    if @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
  
  
  
end
