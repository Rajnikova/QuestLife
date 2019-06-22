class HomeController < ApplicationController
  def index
    require 'will_paginate/array'
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
  end

  def change_locale
    I18n.locale = params[:locale] || I18n.default_locale
    puts 'change language'
    puts I18n.locale
    redirect_to home_path
  end


end
