require "rails_helper"

RSpec.describe Socioeduk::TipoExamesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/tipo_exames").to route_to("socioeduk/tipo_exames#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tipo_exames/new").to route_to("socioeduk/tipo_exames#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tipo_exames/1").to route_to("socioeduk/tipo_exames#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tipo_exames/1/edit").to route_to("socioeduk/tipo_exames#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/tipo_exames").to route_to("socioeduk/tipo_exames#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipo_exames/1").to route_to("socioeduk/tipo_exames#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipo_exames/1").to route_to("socioeduk/tipo_exames#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tipo_exames/1").to route_to("socioeduk/tipo_exames#destroy", :id => "1")
    end

  end
end
