require 'rails_helper'

RSpec.describe "socioeduk/tipo_documento_recepcoes/show", type: :view do
  before(:each) do
    @socioeduk_tipo_documento_recepcao = assign(:socioeduk_tipo_documento_recepcao, Socioeduk::TipoDocumentoRecepcao.create!(
      :tipo_documento_recepcao => "Tipo Documento Recepcao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tipo Documento Recepcao/)
  end
end
