require 'rails_helper'

describe UrlsController do
  describe "POST Create" do
    before do
      post :create, url: "http://www.sueddeutsche-zeitung.de/"
    end

    it "generates a short string" do
      expect(session[:urls].keys.first.length).to eq(6)
    end

    it "stores a new short url in the session hash" do
      expect(session[:urls]).to eq({session[:urls].keys.first => "http://www.sueddeutsche-zeitung.de/"})
    end

    it "renders the new template" do
      expect(response).to redirect_to root_path
    end
  end
end