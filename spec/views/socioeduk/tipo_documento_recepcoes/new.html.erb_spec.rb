require 'rails_helper'

RSpec.describe "socioeduk/tipo_documento_recepcoes/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_documento_recepcao, Socioeduk::TipoDocumentoRecepcao.new(
      :tipo_documento_recepcao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_documento_recepcao form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_documento_recepcoes_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_documento_recepcao[tipo_documento_recepcao]"
    end
  end
end
