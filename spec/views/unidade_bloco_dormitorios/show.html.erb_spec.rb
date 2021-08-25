require 'rails_helper'

RSpec.describe "unidade_bloco_dormitorios/show", type: :view do
  before(:each) do
    @unidade_bloco_dormitorio = assign(:unidade_bloco_dormitorio, UnidadeBlocoDormitorio.create!(
      :unidade_socioeducativa_blocos => nil,
      :descricao => "Descricao",
      :capacidade_base => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(/2/)
  end
end
