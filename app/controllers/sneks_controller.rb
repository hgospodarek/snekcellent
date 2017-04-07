class SneksController < ApplicationController
  before_action :authenticate_user!

  def index
    @sneks = current_user.sneks
  end
end
