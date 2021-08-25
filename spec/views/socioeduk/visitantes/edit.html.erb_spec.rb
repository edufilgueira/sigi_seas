require 'rails_helper'

RSpec.describe "socioeduk/visitantes/edit", type: :view do
  before(:each) do
    @socioeduk_visitante = assign(:socioeduk_visitante, Socioeduk::Visitante.create!(
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

  xit "renders the edit socioeduk_visitante form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_visitante_path(@socioeduk_visitante), "post" do

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
