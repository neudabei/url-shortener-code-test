require 'rails_helper'

describe UrlsController do
  describe "POST Create" do
    before do
      post :create, url: "http://www.sueddeutsche-zeitung.de/"
    end

    it "stores a new short url in the session hash" do
      expect(session[:urls]).to eq({"1a2b3b" => "http://www.sueddeutsche-zeitung.de/"})
    end

    it "renders the new template" do
      expect(response).to render_template :new
    end
  end
end