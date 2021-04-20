class BooksController < ApplicationController
    def show
        @book = Book.find(params[:id])
    end

    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def edit
        @book = Book.find(params[:id]) #find the article
    end

    def create
        @book = Book.new(params.require(:book).permit(:title, :author))
        if @book.save
            flash[:notice] = "Book was added successfully"
            redirect_to @book
        else
            render 'new'
        end
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(params.require(:book).permit(:title, :author))
            flash[:notice] = "Book was updated successfully."
            redirect_to @book 
        else
            render 'edit'
        end
    end

def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
end

end