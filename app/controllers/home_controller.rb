class HomeController < ApplicationController
  def index
    require 'will_paginate/array'
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
    if current_user
    @new_quests = UsersQuest.where(user_id: current_user.id, status: 10)
    end
    @users = User.all
    @top_user = TopUser.last


  end
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    puts 'change t'
    puts I18n.locale
    redirect_to home_path
  end


end
