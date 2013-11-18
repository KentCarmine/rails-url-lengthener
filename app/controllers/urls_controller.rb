class UrlsController < ApplicationController

  def show
    @url = Url.find(params[:id])
    @url.link_views.create

    redirect_to @url.original_url
  end

  def index

  end

  def create
    @url = Url.find_or_create_by_original_url(params[:url])

    if request.xhr?
      render :partial => "show_url", :locals => {:url => @url}
    else
      redirect_to :urls
    end
  end

end