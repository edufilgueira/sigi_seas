require 'rails_helper'

RSpec.describe "socioeduk/visitantes/new", type: :view do
  before(:each) do
    assign(:socioeduk_visitante, Socioeduk::Visitante.new(
      :nome => "MyString",
      :socioeduk_jovem => nil,
      :socioeduk_tipo_documento => nil,
      :numero => "MyString",
      :uf_documento => 1,
      :foto => "MyString",
      :observação => "MyText",
      :anexo => "MyString"
    ))
  end

  xit "renders new socioeduk_visitante form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_visitantes_path, "post" do

      assert_select "input[name=?]", "socioeduk_visitante[nome]"

      assert_select "input[name=?]", "socioeduk_visitante[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_visitante[socioeduk_tipo_documento_id]"

      assert_select "input[name=?]", "socioeduk_visitante[numero]"

      assert_select "input[name=?]", "socioeduk_visitante[uf_documento]"

      assert_select "input[name=?]", "socioeduk_visitante[foto]"

      assert_select "textarea[name=?]", "socioeduk_visitante[observação]"

      assert_select "input[name=?]", "socioeduk_visitante[anexo]"
    end
  end
end
