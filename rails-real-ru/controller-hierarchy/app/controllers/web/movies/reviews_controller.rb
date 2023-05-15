module Web
  module Movies
    class ReviewsController < Web::Movies::ApplicationController
      def index
        @reviews = resource_movie.reviews.order(id: :desc)
      end

      def new
        @review = resource_movie.reviews.build
      end

      def create
        @review = resource_movie.reviews.build(review_params)
        if @review.save
          redirect_to movie_reviews_url resource_movie
        else
          render :new
        end
      end

      def edit
        @review = resource_movie.reviews.find(params[:id])
      end

      def update
        @review = resource_movie.reviews.find(params[:id])
        if @review.update(review_params)
          redirect_to movie_reviews_url resource_movie
        else
          render :edit
        end
      end

      def destroy
        @review = resource_movie.reviews.find(params[:id])
        @review.destroy
        redirect_to movie_reviews_url resource_movie
      end

      private

      def review_params
        params.require(:review).permit(:body)
      end
    end
  end
end
