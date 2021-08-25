require 'rails_helper'

RSpec.describe "socioeduk/tipo_documento_recepcoes/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_documento_recepcao = assign(:socioeduk_tipo_documento_recepcao, Socioeduk::TipoDocumentoRecepcao.create!(
      :tipo_documento_recepcao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_documento_recepcao form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_documento_recepcao_path(@socioeduk_tipo_documento_recepcao), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_documento_recepcao[tipo_documento_recepcao]"
    end
  end
end
