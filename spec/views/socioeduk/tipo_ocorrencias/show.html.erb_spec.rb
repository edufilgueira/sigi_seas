require 'rails_helper'

RSpec.describe "socioeduk/tipo_ocorrencias/show", type: :view do
  before(:each) do
    @socioeduk_tipo_ocorrencia = assign(:socioeduk_tipo_ocorrencia, Socioeduk::TipoOcorrencia.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
