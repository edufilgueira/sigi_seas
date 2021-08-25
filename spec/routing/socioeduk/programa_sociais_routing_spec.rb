require "rails_helper"

RSpec.describe Socioeduk::ProgramaSociaisController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/programa_sociais").to route_to("socioeduk/programa_sociais#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/programa_sociais/new").to route_to("socioeduk/programa_sociais#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/programa_sociais/1").to route_to("socioeduk/programa_sociais#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/programa_sociais/1/edit").to route_to("socioeduk/programa_sociais#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/programa_sociais").to route_to("socioeduk/programa_sociais#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/programa_sociais/1").to route_to("socioeduk/programa_sociais#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/programa_sociais/1").to route_to("socioeduk/programa_sociais#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/programa_sociais/1").to route_to("socioeduk/programa_sociais#destroy", :id => "1")
    end
  end
end
