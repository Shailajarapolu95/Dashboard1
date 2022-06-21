class BooksController < ApplicationController
    def index
      @books = Book.all
      end
      def new
          @book =  Book.new
      end
      def create
          book =  Book.new(book_params)
          book.save 
          redirect_to "/"
      end  
      def edit
          
      end
     
      def update
      
        @book.update(book_params)
    
        redirect_to root_path
      end
    
      private
      def book_params
          params.require(:books).permit(:bname,:author)
      end
  end
  