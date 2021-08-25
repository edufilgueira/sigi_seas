require 'rails_helper'

RSpec.describe "socioeduk/tipo_documento_recepcoes/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_documento_recepcoes, [
      Socioeduk::TipoDocumentoRecepcao.create!(
        :tipo_documento_recepcao => "Tipo Documento Recepcao"
      ),
      Socioeduk::TipoDocumentoRecepcao.create!(
        :tipo_documento_recepcao => "Tipo Documento Recepcao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_documento_recepcoes" do
    render
    assert_select "tr>td", :text => "Tipo Documento Recepcao".to_s, :count => 2
  end
end
