require "rails_helper"

RSpec.describe Socioeduk::TipoDecisaoJudiciaisController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/tipo_decisao_judiciais").to route_to("socioeduk/tipo_decisao_judiciais#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tipo_decisao_judiciais/new").to route_to("socioeduk/tipo_decisao_judiciais#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tipo_decisao_judiciais/1").to route_to("socioeduk/tipo_decisao_judiciais#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tipo_decisao_judiciais/1/edit").to route_to("socioeduk/tipo_decisao_judiciais#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/tipo_decisao_judiciais").to route_to("socioeduk/tipo_decisao_judiciais#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipo_decisao_judiciais/1").to route_to("socioeduk/tipo_decisao_judiciais#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipo_decisao_judiciais/1").to route_to("socioeduk/tipo_decisao_judiciais#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tipo_decisao_judiciais/1").to route_to("socioeduk/tipo_decisao_judiciais#destroy", :id => "1")
    end
  end
end
