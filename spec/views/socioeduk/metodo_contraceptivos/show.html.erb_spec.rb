require 'rails_helper'

RSpec.describe "socioeduk/metodo_contraceptivos/show", type: :view do
  before(:each) do
    @socioeduk_metodo_contraceptivo = assign(:socioeduk_metodo_contraceptivo, Socioeduk::MetodoContraceptivo.create!(
      :descricao => "Descricao",
      :ativo => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(/false/)
  end
end
