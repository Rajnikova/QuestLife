class RoomsController < ApplicationController
  def index
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
    @rooms = Room.all.order('name').paginate(page: params[:page], per_page: 7)
  end

end
