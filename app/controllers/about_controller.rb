class AboutController < ApplicationController
  def index
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
  end
end
