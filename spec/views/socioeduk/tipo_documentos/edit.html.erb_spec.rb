require 'rails_helper'

RSpec.describe "socioeduk/tipo_documentos/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_documento = assign(:socioeduk_tipo_documento, Socioeduk::TipoDocumento.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_documento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_documento_path(@socioeduk_tipo_documento), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_documento[descricao]"
    end
  end
end
