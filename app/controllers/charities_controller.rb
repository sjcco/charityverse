class CharitiesController < ApplicationController
  def new
    @title = 'New Charity Event'
    @charity = Charity.new
    @groups = Group.all.pluck(:name, :id)
    @groups.unshift(['No group', nil])
  end

  def create
    @charity = Charity.new(charity_params)

    if @charity.save
      flash[:notice] = "Charity #{@charity.name} was succesfully created!"
      redirect_to @charity
    else
      flash[:alert] = if @charity.errors.nil?
                        'Something went wrong, please try again'
                      else
                        @charity.errors.messages
                      end
      render 'new'
    end
  end

  def show
    @charity = Charity.find(params[:id])
    @title = @charity.name
    @group = Group.where(id: @charity.group_id).first
  end

  def index
    @title = 'Charities'
    @charities = Charity.where(author_id: current_user.id).includes(:group).order(updated_at: :desc)
    @amount = @charities.pluck(:amount).inject(0, :+)
  end

  def external
    @title = 'External Charities'
    @charities = Charity.where(author_id: current_user.id, group_id: nil).all.order(updated_at: :desc)
    @amount = @charities.pluck(:amount).inject(0, :+)
  end

  def edit
    @charity = Charity.find(params[:id])
    @title = "Edit #{@charity.name}"
    @groups = Group.all.pluck(:name, :id)
    @groups.unshift(['No group', nil])
  end

  def update
    @charity = Charity.find(params[:id])
    if @charity.update(charity_params)
      flash[:notice] = "Charity #{@charity.name} was succesfully updated!"
      redirect_to @charity
    else
      flash[:alert] = if @charity.errors.nil?
                        'Something went wrong, please try again'
                      else
                        @charity.errors.messages
                      end
      render 'edit'
    end
  end

  def destroy
    @charity = Charity.find(params[:id])
    @charity.destroy
    redirect_to charities_path, notice: 'Charity event was succesfully deleted'
  end

  private

  def charity_params
    params.require(:charity).permit(:name, :amount, :author_id, :group_id)
  end
end
