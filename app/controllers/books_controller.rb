class BooksController < ApplicationController
    def show
        @book = Book.find(params[:id])
    end

    def index
        @books = Book.all
    end

    def new
    end

    def create
        @book = Book.new(params.require(:book).permit(:title, :author))
        @book.save
        redirect_to @book
    end

end