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
      redirect_to :index, error: "Oh heck we fucked up."
    end
  end

  def show
    @snek = Snek.find(params[:id])
  end

  def destroy
    @snek = Snek.find(params[:id])
    @snek.destroy
    redirect_to index, notice: "Removed :("
  end

  private

  def snek_params
    params.require(:snek).permit(:name, :sex, :age, :species, :morph, :adoption_date)
  end
end
