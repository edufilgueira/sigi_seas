require "rails_helper"

RSpec.describe Socioeduk::ComposicaoFamiliaresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/composicao_familiares").to route_to("socioeduk/composicao_familiares#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/composicao_familiares/new").to route_to("socioeduk/composicao_familiares#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/composicao_familiares/1").to route_to("socioeduk/composicao_familiares#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/composicao_familiares/1/edit").to route_to("socioeduk/composicao_familiares#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/composicao_familiares").to route_to("socioeduk/composicao_familiares#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/composicao_familiares/1").to route_to("socioeduk/composicao_familiares#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/composicao_familiares/1").to route_to("socioeduk/composicao_familiares#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/composicao_familiares/1").to route_to("socioeduk/composicao_familiares#destroy", :id => "1")
    end
  end
end
