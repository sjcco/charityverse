class CharitiesController < ApplicationController
  def new
    @title = 'New Charity'
    @charity = Charity.new
    @groups = Group.all.pluck(:name, :id)
    @groups.unshift(['No group', nil])
    @id = 'new_charity'
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

  private

  def charity_params
    params.require(:charity).permit(:name, :amount, :author_id, :group_id)
  end
end
