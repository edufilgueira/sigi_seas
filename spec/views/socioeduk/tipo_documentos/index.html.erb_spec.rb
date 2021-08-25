require 'rails_helper'

RSpec.describe "socioeduk/tipo_documentos/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_documentos, [
      Socioeduk::TipoDocumento.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoDocumento.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_documentos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
