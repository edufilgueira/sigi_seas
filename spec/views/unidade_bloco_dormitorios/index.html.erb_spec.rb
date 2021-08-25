require 'rails_helper'

RSpec.describe "unidade_bloco_dormitorios/index", type: :view do
  before(:each) do
    assign(:unidade_bloco_dormitorios, [
      UnidadeBlocoDormitorio.create!(
        :unidade_socioeducativa_blocos => nil,
        :descricao => "Descricao",
        :capacidade_base => 2
      ),
      UnidadeBlocoDormitorio.create!(
        :unidade_socioeducativa_blocos => nil,
        :descricao => "Descricao",
        :capacidade_base => 2
      )
    ])
  end

  it "renders a list of unidade_bloco_dormitorios" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
