require 'rails_helper'

RSpec.describe "socioeduk/jovem_documentos/new", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_documento, Socioeduk::JovemDocumento.new(
      :socioeduk_jovem => nil,
      :socioeduk_tipo_documento => nil,
      :numero => "MyString",
      :origem_documento => 1,
      :destino_documento => 1
    ))
  end

  xit "renders new socioeduk_jovem_documento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_documentos_path, "post" do

      assert_select "input[name=?]", "socioeduk_jovem_documento[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_jovem_documento[socioeduk_tipo_documento_id]"

      assert_select "input[name=?]", "socioeduk_jovem_documento[numero]"

      assert_select "input[name=?]", "socioeduk_jovem_documento[origem_documento]"

      assert_select "input[name=?]", "socioeduk_jovem_documento[destino_documento]"
    end
  end
end
