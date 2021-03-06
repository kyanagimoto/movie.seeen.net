# encoding: utf-8

class MyController < ApplicationController

  SUMMARY_LIMIT = 5
  RECOMMEND_DIR = '/usr/local/apps/movie_seen/data/recommend'

  def activity
    page_title "あなたの映画活動"
    description "年間、月間に映画をどれくらい見たかが分かります。意外に忘れてますよ。"

    @my = Author.active.where(:id => params[:author_id]).first
    if @my.blank?
      return redirect_to search_path
    end

    @month = MonthlySeen.active.where :author_id => @my.id
    @month = @month.active.order "date DESC"
  end

  def summary
    page_title "あなたの映画管理"
    description "お気に入りの映画、見たい映画、見たことある映画、あなたの映画嗜好に近い人たちが分かります。"

    @my = Author.active.where(:id => params[:author_id]).first
    if @my.blank?
      return redirect_to search_path
    end

    @recently_seen = Seen.all_seens @my.id
    @recently_seen = @recently_seen.order('date desc').order('id desc')
    @recently_seen = @recently_seen.limit SUMMARY_LIMIT

    some_seen = Seen.active.where(:author_id => @my.id)
    some_seen = some_seen.order('date desc').order('id desc')

    @wish_seen = some_seen.where Seen.wish
    @wish_seen = @wish_seen.limit(SUMMARY_LIMIT)

    if @my.id != @author.id
      @star_seen = some_seen.stars
      @star_seen = @star_seen.limit SUMMARY_LIMIT
    end

    @recommend_users = fetch_recommend @my.id

    @display        = SUMMARY_LIMIT
    @weekly_ranking = fetch_ranking [:weekly_movie]
    @wishs_ranking  = fetch_ranking [:wishs]

    @monthly = MonthlySeen.active.where :author_id => @my.id
    @monthly = @monthly.monthly(DateTime.now).first
    if @monthly.blank?
      @monthly = MonthlySeen.new do |mons|
        mons.author_id = @my.id
        mons.date      = DateTime.now
        mons.all       = 0
        mons.stars     = 0
        mons.wishes    = 0
      end
    end
  end


  private

  def fetch_recommend(author_id)
    directory_name = "#{RECOMMEND_DIR}/#{Digest::MD5.hexdigest(author_id.to_s)[0, 2]}"
    users = YAML.load_file "#{directory_name}/#{author_id}.yml"
    recommends = users.map do |user_id, approximation|
      recommend_user = Author.active.where(:id => user_id)
      if recommend_user.first.blank?
        next
      end
      {:id => user_id, :name => recommend_user.first.name, :approximation => approximation}
    end
    recommends
  rescue Exception => e
    []
  end
end
