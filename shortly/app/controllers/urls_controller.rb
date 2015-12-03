class UrlsController < ApplicationController
  def new
  end

  def create
    submitted_url = params[:url]
    shortened_url = generate_short_string

    session[:urls] = Hash.new
    session[:urls][shortened_url] = submitted_url
    redirect_to root_path
  end

  private 

  def generate_short_string
    SecureRandom.urlsafe_base64(4)
  end
end