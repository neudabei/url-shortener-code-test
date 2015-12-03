class UrlsController < ApplicationController
  def new
    session[:urls] ||= Hash.new
    session[:urls]["1a2b3c"] = "http//www.example-domain.com"
  end

  def create
    if params[:url] != "" && url_correct?
      session[:urls] ||= Hash.new

      @submitted_url = params[:url]
      @shortened_url = generate_short_string

      session[:urls][@shortened_url] = @submitted_url
      
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      render :new
    end
  end

  def redirect
    redirect_to session[:urls][(params[:shortly_url])]
  end

  private 

  def generate_short_string
    SecureRandom.urlsafe_base64(4)
  end

  def url_correct?
    params[:url].start_with?('http://')
  end
end