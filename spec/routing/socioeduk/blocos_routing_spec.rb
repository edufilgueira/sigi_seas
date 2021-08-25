require "rails_helper"

RSpec.describe Socioeduk::BlocosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/blocos").to route_to("socioeduk/blocos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/blocos/new").to route_to("socioeduk/blocos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/blocos/1").to route_to("socioeduk/blocos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/blocos/1/edit").to route_to("socioeduk/blocos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/blocos").to route_to("socioeduk/blocos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/blocos/1").to route_to("socioeduk/blocos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/blocos/1").to route_to("socioeduk/blocos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/blocos/1").to route_to("socioeduk/blocos#destroy", :id => "1")
    end
  end
end
