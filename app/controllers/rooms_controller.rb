class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order('name').paginate(page: params[:page], per_page: 7)
  end

end
