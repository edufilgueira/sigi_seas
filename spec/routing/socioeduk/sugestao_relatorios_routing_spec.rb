require "rails_helper"

RSpec.describe Socioeduk::SugestaoRelatoriosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/sugestao_relatorios").to route_to("socioeduk/sugestao_relatorios#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/sugestao_relatorios/new").to route_to("socioeduk/sugestao_relatorios#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/sugestao_relatorios/1").to route_to("socioeduk/sugestao_relatorios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/sugestao_relatorios/1/edit").to route_to("socioeduk/sugestao_relatorios#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/sugestao_relatorios").to route_to("socioeduk/sugestao_relatorios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/sugestao_relatorios/1").to route_to("socioeduk/sugestao_relatorios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/sugestao_relatorios/1").to route_to("socioeduk/sugestao_relatorios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/sugestao_relatorios/1").to route_to("socioeduk/sugestao_relatorios#destroy", :id => "1")
    end
  end
end
