require 'rails_helper'

RSpec.describe "unidade_socioeducativa_blocos/show", type: :view do
  before(:each) do
    @unidade_socioeducativa_bloco = assign(:unidade_socioeducativa_bloco, UnidadeSocioeducativaBloco.create!(
      :descricao => "Descricao",
      :unidades_socioeducativas => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(//)
  end
end
