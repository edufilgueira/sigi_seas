require 'rails_helper'

RSpec.describe "socioeduk/tipo_documentos/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_documento, Socioeduk::TipoDocumento.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_documento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_documentos_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_documento[descricao]"
    end
  end
end
