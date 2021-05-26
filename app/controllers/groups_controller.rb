class GroupsController < ApplicationController
  def new; end

  def show; end

  def index
    @title = 'Groups'
    @groups = Group.all.order(name: :asc)
  end

  def edit; end

  def destroy; end
end
