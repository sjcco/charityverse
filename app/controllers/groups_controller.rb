class GroupsController < ApplicationController
  def new
    @title = 'New Group'
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = "Group #{@group.name} was succesfully created!"
      redirect_to @group
    else
      flash[:alert] = if @group.errors.nil?
                        'Something went wrong, please try again'
                      else
                        @group.errors.messages
                      end
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
    @title = "#{@group.name} transactions"
    @charities = Charity.where(group_id: @group.id).all
  end

  def index
    @title = 'Groups'
    @groups = Group.all.order(name: :asc)
  end

  def edit; end

  def destroy; end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
