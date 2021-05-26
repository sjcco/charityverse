class CharitiesController < ApplicationController
  def new; end

  def show; end

  def index
  @title = 'Charities'
  @charities = Charity.where(author_id: current_user.id).all.order(updated_at: :desc)
  @amount = @charities.pluck(:amount).inject(0, :+)
  end

  def external
    @title = 'External Charities'
    @charities = Charity.where(author_id: current_user.id, group_id: nil).all.order(updated_at: :desc)
    @amount = @charities.pluck(:amount).inject(0, :+)
  end

  def edit; end

  def destroy; end
end
