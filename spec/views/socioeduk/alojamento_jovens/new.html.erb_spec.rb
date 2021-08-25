require 'rails_helper'

RSpec.describe "socioeduk/alojamento_jovens/new", type: :view do
  before(:each) do
    assign(:socioeduk_alojamento_jovem, Socioeduk::AlojamentoJovem.new(
      :socioeduk_jovem => nil,
      :unidade_socioeducativa => nil,
      :socioeduk_bloco => nil,
      :socioeduk_quarto => nil,
      :tamanho_roupa => "MyString",
      :tamanho_cacaldo => "MyString",
      :numero_kit => "MyString"
    ))
  end

  xit "renders new socioeduk_alojamento_jovem form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_alojamento_jovens_path, "post" do

      assert_select "input[name=?]", "socioeduk_alojamento_jovem[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_alojamento_jovem[unidade_socioeducativa_id]"

      assert_select "input[name=?]", "socioeduk_alojamento_jovem[socioeduk_bloco_id]"

      assert_select "input[name=?]", "socioeduk_alojamento_jovem[socioeduk_quarto_id]"

      assert_select "input[name=?]", "socioeduk_alojamento_jovem[tamanho_roupa]"

      assert_select "input[name=?]", "socioeduk_alojamento_jovem[tamanho_cacaldo]"

      assert_select "input[name=?]", "socioeduk_alojamento_jovem[numero_kit]"
    end
  end
end
