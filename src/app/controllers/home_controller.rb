class HomeController < ApplicationController
  def index
    require 'will_paginate/array'
    @users = User.all
    @top_user = User.all.max_by { |user| [user.level, user.score] }
  
    con = PG.connect dbname: 'dbs_development', user: 'majka', password: 'Leafeon'
  
    result = con.exec 'SELECT tab.qi quest_id, count(*) completed
                       FROM
                         (SELECT quests.id qi, *
                          FROM quests
                          JOIN users_quests uq ON quests.id = uq.quest_id
                          WHERE uq.status = 2) AS tab
                       GROUP BY qi
                       ORDER by count(*) DESC
                       LIMIT 10'
    @top_quest = Array.new()
    @top_quest_count = Array.new()
    result.each_with_index do |res, i|
      @top_quest[i] = Quest.find_by_id(res['quest_id'])
      @top_quest_count[i] = res['completed']
    end
    @top_quest = @top_quest.paginate(page: params[:page], per_page: 7)
  end
end
