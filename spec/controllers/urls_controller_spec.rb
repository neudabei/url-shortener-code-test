require 'rails_helper'

describe UrlsController do
  describe "POST Create" do
    context "correct URL entered" do
      before do
        post :create, url: "http://www.sueddeutsche-zeitung.de/this-interesting-article"
      end

      it "generates a short string" do
        expect(session[:urls].keys.first.length).to eq(6)
      end

      it "stores a new short url in the session hash" do
        expect(session[:urls]).to eq({session[:urls].keys.first => "http://www.sueddeutsche-zeitung.de/this-interesting-article"})
      end

      it "stores multiple urls in the session hash" do
        post :create, url: "http://www.google.com/"
        expect(session[:urls].keys.count).to eq(2)
      end

      it "renders the new template" do
        expect(response).to redirect_to root_path
      end
    end

    context "incorrect URL entered" do
      before do
        post :create, url: "-zeitung.de/"
      end

      it "it doesn't write to sessions hash" do
        expect(session[:urls]).to eq(nil)
      end

    end

    context "no URL entered" do
      before do
        post :create, url: ""
      end

      it "it doesn't write to sessions hash" do
        expect(session[:urls]).to eq(nil)
      end
    end
  end

  describe "GET redirect" do
    before do
      session[:urls] = Hash.new
      session[:urls]["1a2b3c"] = "http://www.sueddeutsche-zeitung.de"
      get :redirect, shortly_url: "1a2b3c"
    end

    it "redirects to the long url" do
      expect(response).to redirect_to "http://www.sueddeutsche-zeitung.de"
    end
  end
end