# frozen_string_literal: true

class Web::ArticlesController < Web::ApplicationController
  # BEGIN
  caches_action :show
  # END

  def index
    @articles = Article.all
  end

  # BEGIN
  def show
    @article = Article.find(params[:id])
    Rails.cache.write('date_of_reading', DateTime.now, expires_in: 12.hours)
  end
  # END
end
