# frozen_string_literal: true

class Web::RepositoriesController < Web::ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def show
    @repository = Repository.find params[:id]
  end

  def create
    # BEGIN
    repository = Repository.new(link: params[:repository][:link])
    if repository.save
      RepositoryLoaderJob.perform_later(repository)
      redirect_to repositories_path, notice: 'Repo created'
    else
      render :new, notice: 'Repo alredy exists'
    end

    # END
  end

  def update
    # BEGIN
    repository = Repository.find(params[:id])
    RepositoryLoaderJob.perform_later(repository)
    redirect_to repositories_path, notice: 'Repo updated'
    # END
  end

  def update_repos
    # BEGIN
    repositories = Repository.order(updated_at: :desc)
    repositories.each do |repository|
      RepositoryLoaderJob.perform_later(repository)
    end
    redirect_to repositories_path, notice: 'Repos updated'
    # END
  end

  def destroy
    @repository = Repository.find params[:id]

    if @repository.destroy
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
  end

  private

  def permitted_params
    params.require(:repository).permit(:link)
  end
end
