require 'rails_helper'

RSpec.describe "socioeduk/tipo_retornos/show", type: :view do
  before(:each) do
    @socioeduk_tipo_retorno = assign(:socioeduk_tipo_retorno, Socioeduk::TipoRetorno.create!(
      :descricao => "Descricao"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
