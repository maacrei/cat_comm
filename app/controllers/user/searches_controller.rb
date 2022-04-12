class User::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    if @model == 'user'
      # @records = User.search_for(@content)
      @records = User.search_for(@content)
    elsif @model == 'post_image'
      @records = PostImage.search_for(@content)
    end
  end

end
