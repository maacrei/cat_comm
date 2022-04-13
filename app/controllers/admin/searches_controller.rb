class Admin::SearchesController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    if @model == 'user'
      @records = User.search_for(@content)
    elsif @model == 'post_image'
      @records = PostImage.search_for(@content)
    end
  end

end