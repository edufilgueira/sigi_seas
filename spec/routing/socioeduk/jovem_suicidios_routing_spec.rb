require "rails_helper"

RSpec.describe Socioeduk::JovemSuicidiosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/jovem_suicidios").to route_to("socioeduk/jovem_suicidios#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/jovem_suicidios/new").to route_to("socioeduk/jovem_suicidios#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/jovem_suicidios/1").to route_to("socioeduk/jovem_suicidios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/jovem_suicidios/1/edit").to route_to("socioeduk/jovem_suicidios#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/jovem_suicidios").to route_to("socioeduk/jovem_suicidios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/jovem_suicidios/1").to route_to("socioeduk/jovem_suicidios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/jovem_suicidios/1").to route_to("socioeduk/jovem_suicidios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/jovem_suicidios/1").to route_to("socioeduk/jovem_suicidios#destroy", :id => "1")
    end
  end
end
