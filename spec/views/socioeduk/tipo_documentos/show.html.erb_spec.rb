require 'rails_helper'

RSpec.describe "socioeduk/tipo_documentos/show", type: :view do
  before(:each) do
    @socioeduk_tipo_documento = assign(:socioeduk_tipo_documento, Socioeduk::TipoDocumento.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
