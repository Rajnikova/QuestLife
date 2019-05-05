class RoomsController < ApplicationController
  def index
    @rooms = Room.all.paginate(page: params[:page], per_page: 7)
  end

end
