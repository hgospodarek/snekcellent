class SneksController < ApplicationController
  before_action :authenticate_user!

  def index
    @sneks = current_user.sneks.order(:name)
    @snek = Snek.new
  end

  def create
    @snek = Snek.new(snek_params)
    @snek.user = current_user
    if @snek.save
      redirect_to @snek, notice: "#{@snek.name} succsessssfully created."
    else
      render action: 'index', error: "There were troubles creating your snek, please try again."
    end
  end

  def show
    @snek = Snek.find(params[:id])
  end

  private

  def snek_params
    params.require(:snek).permit(:name, :age, :adoption_date)
  end
end
