require "rails_helper"

RSpec.describe Socioeduk::ProcessosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/processos").to route_to("socioeduk/processos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/processos/new").to route_to("socioeduk/processos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/processos/1").to route_to("socioeduk/processos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/processos/1/edit").to route_to("socioeduk/processos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/processos").to route_to("socioeduk/processos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/processos/1").to route_to("socioeduk/processos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/processos/1").to route_to("socioeduk/processos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/processos/1").to route_to("socioeduk/processos#destroy", :id => "1")
    end
  end
end
