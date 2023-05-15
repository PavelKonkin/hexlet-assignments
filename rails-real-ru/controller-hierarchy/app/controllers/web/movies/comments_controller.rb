module Web
  module Movies
    class CommentsController < Web::Movies::ApplicationController
      def index
        @comments = resource_movie.comments.order(id: :desc)
      end

      def new
        @comment = resource_movie.comments.build
      end

      def create
        @comment = resource_movie.comments.build(comment_params)
        if @comment.save
          redirect_to movie_comments_url resource_movie
        else
          render :new
        end
      end

      def edit
        @comment = resource_movie.comments.find(params[:id])
      end

      def update
        @comment = resource_movie.comments.find(params[:id])
        if @comment.update(comment_params)
          redirect_to movie_comments_url resource_movie
        else
          render :edit
        end
      end

      def destroy
        @comment = resource_movie.comments.find(params[:id])
        @comment.destroy
        redirect_to movie_comments_url resource_movie
      end

      private

      def comment_params
        params.require(:comment).permit(:body)
      end
    end
  end
end
