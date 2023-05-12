# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN

  def index?
    true
  end

  def show?
    true
  end

  def create?
    @user
  end

  def new?
    create?
  end

  def update?
    author? || (@user&&@user.admin?)
  end

  def edit?
    update?
  end

  def destroy?
    @user&&@user.admin?
  end

  private

  def author?
    @record.author == @user
  end
  # END
end
