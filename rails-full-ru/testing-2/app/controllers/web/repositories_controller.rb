# frozen_string_literal: true

# BEGIN
require 'octokit'
# END

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
    link = params[:repository][:link]
    link_arr = link.split('/')
    client = Octokit::Client.new
    repo_data = client.repo("#{link_arr[-2]}/#{link_arr[-1]}")
    repository = Repository.new
    repository.link = repo_data['html_url']
    repository.owner_name = repo_data['owner']['login']
    repository.repo_name = repo_data['name']
    repository.description = repo_data['description']
    repository.default_branch = repo_data['default_branch']
    repository.watchers_count = repo_data['watchers_count']
    repository.language = repo_data['language']
    repository.repo_created_at = repo_data['created_at']
    repository.repo_updated_at = repo_data['updated_at']
    repository.save
    redirect_to repositories_path, notice: 'Repository has been created'
  rescue Octokit::InvalidRepository, Octokit::NotFound
    redirect_to new_repository_path, notice: 'Repository not found'
    # END
  end

  def edit
    @repository = Repository.find params[:id]
  end

  def update
    @repository = Repository.find params[:id]

    if @repository.update(permitted_params)
      redirect_to repositories_path, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :edit, status: :unprocessable_entity
    end
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
