require 'octokit'

class RepositoryLoaderJob < ApplicationJob
  queue_as :default
  # before_perform do
  #   repository.fetch!
  # end

  # after_perform do
  #   repository.successfully_fetched!
  # end

  def perform(repository)
    repository.fetch!
    link = repository.link
    link_arr = link.split('/')
    client = Octokit::Client.new
    repo_data = client.repo("#{link_arr[-2]}/#{link_arr[-1]}")
    repository.owner_name = repo_data['owner']['login']
    repository.repo_name = repo_data['name']
    repository.description = repo_data['description']
    repository.default_branch = repo_data['default_branch']
    repository.watchers_count = repo_data['watchers_count']
    repository.language = repo_data['language']
    repository.repo_created_at = repo_data['created_at']
    repository.repo_updated_at = repo_data['updated_at']
    repository.save
    repository.successfully_fetched!
  rescue Octokit::InvalidRepository, Octokit::NotFound
    repository.fetch_failed!
  end
end
