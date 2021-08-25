require 'rails_helper'

RSpec.describe "socioeduk/entorpecentes/show", type: :view do
  before(:each) do
    @socioeduk_entorpecente = assign(:socioeduk_entorpecente, Socioeduk::Entorpecente.create!(
      :descricao => "Descricao",
      :unidades_medida => nil,
      :status => false
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
