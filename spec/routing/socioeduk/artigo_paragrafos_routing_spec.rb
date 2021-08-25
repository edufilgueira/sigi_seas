require "rails_helper"

RSpec.describe Socioeduk::ArtigoParagrafosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/artigo_paragrafos").to route_to("socioeduk/artigo_paragrafos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/artigo_paragrafos/new").to route_to("socioeduk/artigo_paragrafos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/artigo_paragrafos/1").to route_to("socioeduk/artigo_paragrafos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/artigo_paragrafos/1/edit").to route_to("socioeduk/artigo_paragrafos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/artigo_paragrafos").to route_to("socioeduk/artigo_paragrafos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/artigo_paragrafos/1").to route_to("socioeduk/artigo_paragrafos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/artigo_paragrafos/1").to route_to("socioeduk/artigo_paragrafos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/artigo_paragrafos/1").to route_to("socioeduk/artigo_paragrafos#destroy", :id => "1")
    end
  end
end
