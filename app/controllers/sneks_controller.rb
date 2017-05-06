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

  def update
    @snek = Snek.find(params[:id])
    if @snek.update(snek_params)
      redirect_to @snek, notice: "Snek succsessssfully updated."
    else
      redirect_to @snek, error: "Oh heck we fucked up."
    end
  end

  def destroy
    @snek = Snek.find(params[:id])
    name = @snek.name
    @snek.destroy
    redirect_to index, notice: "#{name} removed :("
  end

  private

  def snek_params
    params.require(:snek).permit(:name, :sex, :age, :species, :morph, :adoption_date)
  end
end
