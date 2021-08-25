require "rails_helper"

RSpec.describe Biblioteca::EmprestimosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/biblioteca/emprestimos").to route_to("biblioteca/emprestimos#index")
    end

    it "routes to #new" do
      expect(:get => "/biblioteca/emprestimos/new").to route_to("biblioteca/emprestimos#new")
    end

    it "routes to #show" do
      expect(:get => "/biblioteca/emprestimos/1").to route_to("biblioteca/emprestimos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/biblioteca/emprestimos/1/edit").to route_to("biblioteca/emprestimos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/biblioteca/emprestimos").to route_to("biblioteca/emprestimos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/biblioteca/emprestimos/1").to route_to("biblioteca/emprestimos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/biblioteca/emprestimos/1").to route_to("biblioteca/emprestimos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/biblioteca/emprestimos/1").to route_to("biblioteca/emprestimos#destroy", :id => "1")
    end
  end
end
