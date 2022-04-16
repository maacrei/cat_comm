class User::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    # .order(created_at: :desc)で投稿を新着順に表示
    if @model == 'user'
      @records = User.search_for(@content).order(created_at: :desc).page(params[:page]).per(10)
    elsif @model == 'post_image'
      @records = PostImage.search_for(@content).order(created_at: :desc).page(params[:page]).per(10)
    elsif @model == 'genre'
      @records = Genre.search_for(@content).order(created_at: :desc).page(params[:page]).per(10)
    end
  end

end