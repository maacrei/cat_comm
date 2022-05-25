class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @model = params[:model]
    @content = params[:content]
    # .order(created_at: :desc)で投稿を新着順に表示
    @records = if @model == "user"
                User.user_name_like(@content).order(created_at: :desc)
               elsif @model == "post_image"
                PostImage.title_like(@content).order(created_at: :desc)
               elsif @model == "genre"
                Genre.genre_name_like(@content).order(created_at: :desc)
               end
    @records = @records.page(params[:page]).per(12)
  end

end